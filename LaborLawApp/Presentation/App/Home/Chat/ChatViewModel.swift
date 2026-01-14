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
    @Injected(\.getChatDetailUseCase) var getChatDetailUseCase
    @Published var userMessage: String = ""
    @Published var chatMessage: [ChatMessage] = []
    @Published var conversationId: Int? = nil
    
    @Published var isWaiting: Bool = false
    
    @Published var isLoadingChatList: Bool = false
    
    private var loadingTask: Task<Void, Never>?
    
    init(conversationId: Int?) {
        self.conversationId = conversationId

        if let id = conversationId {
            Task {
                await getChatList(id: id)
            }
        }
    }
    
    @MainActor
    func getChatList(id: Int) async {
        isLoadingChatList = true

        let result = await getChatDetailUseCase.execute(id: id)

        isLoadingChatList = false

        switch result {
        case .success(let response):
            self.chatMessage = response

        case .failure:
            self.chatMessage = []
            break
        }
    }
    
    @MainActor
    func send() async {
        let message = userMessage
        userMessage = ""
        
        // 1. 유저 메시지
        chatMessage.append(
            ChatMessage(role: .user, text: message, state: .done)
        )
        
        // 2. AI 로딩 메시지
        let aiMessageID = UUID()
        chatMessage.append(
            ChatMessage(
                id: aiMessageID,
                role: .ai,
                text: "답변을 생성하는 중입니다",
                state: .loading
            )
        )
        
        // 3. 로딩 애니메이션
        startLoadingAnimation(messageID: aiMessageID)
        
        // 4. API 요청 (백그라운드 자동 처리)
        let result = await chatUseCase.execute(
            ChatAnswer(
                text: message,
                conversationId: conversationId
            )
        )
        
        stopLoadingAnimation()
        
        switch result {
        case .success(let response):
            // ✅ await 가능
            await streamAnswer(
                response.text,
                messageID: aiMessageID
            )
            self.conversationId = response.conversationId
            
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
