//
//  ChatViewModel.swift
//  LaborLawApp
//
//  Created by Carki on 1/11/26.
//

import Foundation

import Factory

final class ChatViewModel: ObservableObject {
    @Injected(\.chatUseCase) var chatUseCase
    @Published var userMessage: String = ""
    @Published var chatMessage: [ChatMessage] = []
    
    @Published var isWaiting: Bool = false
    
    private var loadingTask: Task<Void, Never>?
//    func send() async {
//        let message = userMessage
//        
//        DispatchQueue.main.async { [weak self] in
//            guard let self = self else { return }
//            self.chatMessage.append(ChatMessage(role: .user, text: message, state: .done))
//            self.userMessage = ""
//            self.isWaiting = true
//            
//            let aiMessageID = UUID()
//            chatMessage.append(
//                ChatMessage(
//                    id: aiMessageID,
//                    role: .ai,
//                    text: "답변을 생성하는 중입니다",
//                    state: .loading
//                )
//            )
//        }
//        
//        let result = await self.chatUseCase.execute(message)
//        
//        DispatchQueue.main.async { [weak self] in
//            guard let self = self else { return }
//            
//            switch result {
//            case .success(let response):
//                self.chatMessage.append(ChatMessage(role: .ai, text: response.text))
//                print("요청 성공!: ", response)
//            case .failure(let error):
//                
//                print("요청 실패!: ", error)
//            }
//            
//            self.isWaiting = false
//        }
//    }
    @MainActor
    func send() async {
        let message = userMessage
        userMessage = ""

        // 1. 유저 메시지 추가
        chatMessage.append(
            ChatMessage(role: .user, text: message, state: .done)
        )

        // 2. AI 로딩 메시지 미리 추가
        let aiMessageID = UUID()
        chatMessage.append(
            ChatMessage(
                id: aiMessageID,
                role: .ai,
                text: "답변을 생성하는 중입니다",
                state: .loading
            )
        )

        // 3. 로딩 애니메이션 시작
        startLoadingAnimation(messageID: aiMessageID)

        // 4. API 요청
        let result = await chatUseCase.execute(message)

        stopLoadingAnimation()

        switch result {
        case .success(let response):
            await streamAnswer(
                response.text,
                messageID: aiMessageID
            )
        case .failure:
            updateMessage(
                id: aiMessageID,
                text: "답변 생성에 실패했습니다.",
                state: .done
            )
        }
    }
    private func startLoadingAnimation(messageID: UUID) {
        loadingTask = Task {
            var dots = ""
            while !Task.isCancelled {
                dots = dots.count >= 3 ? "" : dots + "."
                updateMessage(
                    id: messageID,
                    text: "답변을 생성하는 중입니다\(dots)",
                    state: .loading
                )
                try? await Task.sleep(nanoseconds: 500_000_000)
            }
        }
    }

    private func stopLoadingAnimation() {
        loadingTask?.cancel()
        loadingTask = nil
    }
    
    private func streamAnswer(_ text: String, messageID: UUID) async {
        updateMessage(id: messageID, text: "", state: .streaming)

        for char in text {
            try? await Task.sleep(nanoseconds: 30_000_000)
            appendCharacter(
                id: messageID,
                char: char
            )
        }

        updateState(id: messageID, state: .done)
    }

    private func updateMessage(
        id: UUID,
        text: String,
        state: ChatMessageState
    ) {
        if let index = chatMessage.firstIndex(where: { $0.id == id }) {
            chatMessage[index].text = text
            chatMessage[index].state = state
        }
    }

    private func appendCharacter(id: UUID, char: Character) {
        if let index = chatMessage.firstIndex(where: { $0.id == id }) {
            chatMessage[index].text.append(char)
        }
    }

    private func updateState(id: UUID, state: ChatMessageState) {
        if let index = chatMessage.firstIndex(where: { $0.id == id }) {
            chatMessage[index].state = state
        }
    }

}
