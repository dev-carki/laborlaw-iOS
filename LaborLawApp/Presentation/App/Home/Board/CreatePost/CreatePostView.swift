//
//  CreatePostView.swift
//  LaborLawApp
//
//  Created by Carki on 1/20/26.
//

import SwiftUI

struct CreatePostView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject var coordinator = Coordinator()
    
    @StateObject private var viewModel = CreatePostViewModel()
    
    var body: some View {
        ZStack {
            NavigationView {
                ZStack {
                    VStack(spacing: 0) {
                        coordinator.navigationLinkSection()
                        
                        TopBarView(type: .back, text: "Q&A 작성", onTap: {
                            self.presentationMode.wrappedValue.dismiss()
                        }, rightText: "작성완료") {
                            Task {
                                await viewModel.createPost()
                            }
                        }
                        
                        ScrollView(showsIndicators: false) {
                            VStack(spacing: 24) {
                                CustomTextFieldWithTitle(inputText: $viewModel.titleText, titleText: "제목", placeHolderText: "제목을 입력해주세요.")
                                
                                VStack(spacing: 0) {
                                    CustomSelectBox(title: "title", selected: viewModel.selectedCategory?.name, placeholder: "법률 카테고리를 선택해주세요.") {
                                        withAnimation(.spring(response: 0.3, dampingFraction: 0.85)) {
                                            viewModel.isCategoryDropdownOpen.toggle()
                                        }
                                    }
                                    
                                    if viewModel.isCategoryDropdownOpen {
                                        CategoryDropdownView(items: viewModel.categories) { category in
                                            viewModel.selectedCategory = category
                                            
                                            withAnimation(.easeOut(duration: 0.2)) {
                                                viewModel.isCategoryDropdownOpen = false
                                            }
                                        }
                                        .transition(
                                            .asymmetric(
                                                insertion: .scale(scale: 0.98, anchor: .top).combined(with: .opacity),
                                                removal: .opacity
                                            )
                                        )
                                    }
                                }
                                
                                CustomTextEditor(text: $viewModel.contentsText, titleText: "내용", placeholder: "상세 내용을 입력해주세요.", maxTextLength: 1000)
                                
                            }
                            .padding(.all, 16)
                        }
                    }
                }
            }
            
            if viewModel.isLoadingCategories {
                CustomLoadingView(titleText: "불러오는 중입니다.", isLoading: viewModel.isLoadingCategories)
            }
            
            if viewModel.isLoadingCategoriesSuccess == false {
                CustomPopupView(titleText: "네트워크 에러", buttonText: "재요청", tapGesture: {
                    viewModel.isLoadingCategoriesSuccess = true
                    
                    Task {
                        await viewModel.getAllCategories()
                    }
                }, cancelButtonText: "돌아가기") {
                    self.presentationMode.wrappedValue.dismiss()
                }
            }
            
            if viewModel.isCreatingPostSuccess {
                CustomPopupView(titleText: "게시 완료", buttonText: "돌아가기") {
                    self.presentationMode.wrappedValue.dismiss()
                }
            }
        }
        .navigationViewStyle(.stack)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden()
        .onAppear {
            Task {
                await viewModel.getAllCategories()
            }
        }
    }
}

#Preview {
    CreatePostView()
}
