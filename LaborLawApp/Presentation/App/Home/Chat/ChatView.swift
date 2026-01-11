//
//  ChatView.swift
//  LaborLawApp
//
//  Created by Carki on 1/11/26.
//

import SwiftUI

struct ChatView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject var coordinator = Coordinator()
    @StateObject private var viewModel = ChatViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 0) {
                    coordinator.navigationLinkSection()
                    TopBarView(type: .back, text: "채팅") {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                    
                    ScrollViewReader { proxy in
                        ScrollView(showsIndicators: false) {
                            LazyVStack(alignment: .leading, spacing: 12) {
                                ForEach(viewModel.chatMessage) { message in
                                    ChatBubble(message: message)
                                        .id(message.id) // ⭐️ 중요
                                }
                            }
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                        }
                        .onChange(of: viewModel.chatMessage.count) { _ in
                            scrollToBottom(proxy)
                        }
                    }
                    
                    InputChatBox(inputText: $viewModel.userMessage, placeHolderText: "") {
                        Task {
                            await viewModel.send()
                        }
                        
                    }
                    .padding(.horizontal, 16)
                }
            }
        }
        .navigationViewStyle(.stack)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden()
    }
    
    private func scrollToBottom(_ proxy: ScrollViewProxy) {
        guard let last = viewModel.chatMessage.last else { return }
        withAnimation(.easeOut(duration: 0.25)) {
            proxy.scrollTo(last.id, anchor: .bottom)
        }
    }
}

#Preview {
    ChatView()
}
