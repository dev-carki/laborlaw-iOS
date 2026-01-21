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
                            LazyVStack(alignment: .leading, spacing: 12) {
                                ForEach(viewModel.postDatas) { post in
                                    PostListBox(data: post)
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
        .onAppear {
            Task {
                await self.viewModel.getAllPostList()
            }
        }
    }
}

#Preview {
    BoardMainView()
}
