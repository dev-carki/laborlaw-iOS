//
//  BoardMainView.swift
//  LaborLawApp
//
//  Created by Carki on 1/20/26.
//

import SwiftUI

struct BoardMainView: View {
    @StateObject private var viewModel = BoardMainViewModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var postRefreshStore: PostRefreshStore
    @StateObject var coordinator = Coordinator()
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 0) {
                    coordinator.navigationLinkSection()
                    
                    TopBarView(type: .back, text: "게시판", rightIconName: "square.and.pencil") {
                        self.presentationMode.wrappedValue.dismiss()
                    } onRightTap: {
                        self.coordinator.push(destination: .createPost)
                    }
                    
                    ScrollViewReader { proxy in
                        ScrollView(showsIndicators: false) {
                            LazyVStack(alignment: .leading, spacing: 0) {
                                ForEach(viewModel.postDatas) { post in
                                    PostListBox(data: post)
                                        .padding(.all, 8)
                                        .onTapGesture {
                                            self.coordinator.push(destination: .postDetail(postId: post.id))
                                        }
                                }
                            }
                        }
                    }
                }
            }
        }
        .navigationViewStyle(.stack)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden()
        .onAppear {
            Task {
                await self.viewModel.getAllPostList()
            }
        }
        .onChange(of: postRefreshStore.shouldRefreshBoard) { value in
            guard value else { return }

            Task {
                await viewModel.getAllPostList()
                postRefreshStore.shouldRefreshBoard = false
            }
        }
    }
}

#Preview {
    BoardMainView()
}
