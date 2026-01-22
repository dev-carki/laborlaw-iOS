//
//  ChatListView.swift
//  LaborLawApp
//
//  Created by Carki on 1/14/26.
//

import SwiftUI

struct ChatListView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject var coordinator = Coordinator()
    @StateObject private var viewModel = ChatListViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 0) {
                    coordinator.navigationLinkSection()
                    TopBarView(type: .back, text: "채팅 목록", rightIconName: "square.and.pencil") {
                        self.presentationMode.wrappedValue.dismiss()
                    } onRightTap: {
                        self.coordinator.push(destination: .chat(viewModel: ChatViewModel(conversationId: nil)))
                    }
                    
                    ScrollViewReader { proxy in
                        ScrollView(showsIndicators: false) {
                            LazyVStack(alignment: .leading, spacing: 12) {
                                ForEach(viewModel.chatListData) { message in
                                    ChatListBox(titleText: message.title, dateText: message.createdAt)
                                        .onTapGesture {
                                            self.coordinator.push(destination: .chat(viewModel: ChatViewModel(conversationId: message.id)))
                                        }
                                }
                            }
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                        }
                    }
                }
            }
        }
        .navigationViewStyle(.stack)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden()
        .onAppear(perform: {
            Task {
                await viewModel.getChatList()
            }
        })
    }
}

#Preview {
    ChatListView()
}
