//
//  PostDetailView.swift
//  LaborLawApp
//
//  Created by Carki on 1/21/26.
//

import SwiftUI

struct PostDetailView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject var coordinator = Coordinator()
    
    @StateObject var viewModel: PostDetailViewModel
    
    private var category: PostCategoryEnum? {
        PostCategoryEnum(rawValue: viewModel.postData?.category ?? 0)
    }
    
    var body: some View {
        ZStack {
            NavigationView {
                ZStack {
                    if let postData = viewModel.postData {
                        VStack(spacing: 0) {
                            coordinator.navigationLinkSection()
                            
                            TopBarView(type: .back, text: postData.nickName) {
                                self.presentationMode.wrappedValue.dismiss()
                            }
                            
                            ScrollView(showsIndicators: false) {
                                VStack(alignment: .leading, spacing: 16) {
                                    HStack {
                                        if let category = category {
                                            Text(category.title)
                                                .font(Font.categoryTextBadge)
                                                .foregroundColor(.white)
                                                .padding(.all, 6)
                                                .background(category.color)
                                                .clipShape(Capsule())
                                        } else {
                                            Text("알 수 없음")
                                                .font(Font.categoryTextBadge)
                                                .foregroundColor(.white)
                                                .padding(.all, 6)
                                                .background(CustomColor.customGray300)
                                                .clipShape(Capsule())
                                        }
                                        
                                        Spacer()
                                        
                                    }
                                    
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text(postData.titleText)
                                            .foregroundColor(CustomColor.customBlack)
                                            .font(Font.titleText)
                                        
                                        Text(String(postData.createdAt))
                                            .foregroundColor(CustomColor.customDarkgray)
                                            .font(Font.chatBoxDateText)
                                    }
                                    
                                    Text(postData.nickName)
                                        .foregroundColor(CustomColor.customDarkgray)
                                        .font(Font.chatBoxDateText)
                                    
                                    Rectangle()
                                        .foregroundColor(CustomColor.customGray300)
                                        .frame(height: 1)
                                        .padding(.horizontal, -16)
                                    
                                    Text(postData.contentText)
                                        .foregroundColor(CustomColor.customBlack)
                                        .font(Font.chatBoxDateText)
                                        .multilineTextAlignment(.leading)
                                    
                                    Rectangle()
                                        .foregroundColor(CustomColor.customGray300)
                                        .frame(height: 5)
                                        .padding(.horizontal, -16)
                                    
                                    Text("댓글")
                                        .foregroundColor(CustomColor.customBlack)
                                        .font(Font.titleText)
                                    
                                    LazyVStack(alignment: .leading, spacing: 0) {
                                        ForEach(viewModel.reviewData) { review in
                                            CustomReviewBox(data: review)
                                        }
                                    }
                                    .padding(.horizontal, -16)
                                    
                                }
                                .padding(.horizontal, 16)
                            }
                        }
                    }
                    else {
                        VStack(spacing: 0) {
                            coordinator.navigationLinkSection()
                            
                            TopBarView(type: .back, text: "알 수 없는 게시글") {
                                self.presentationMode.wrappedValue.dismiss()
                            }
                            
                            Spacer()
                            
                            VStack(spacing: 12) {
                                Text("네트워크 상태를 확인해주세요")
                                
                                VStack {
                                    Image(systemName: "arrow.counterclockwise.circle.fill")
                                        .resizable()
                                        .foregroundColor(CustomColor.customDarkgray)
                                        .padding(.all, 8)
                                }
                                .frame(width: 36, height: 36)
                                .onTapGesture {
                                    Task {
                                        await viewModel.loadInitialData()
                                    }
                                }
                            }
                            
                            Spacer()
                        }
                    }
                    
                    VStack {
                        Spacer()
                        
                        InputReviewBox(inputText: $viewModel.reviewText, placeHolderText: "댓글 작성") {
                            Task {
                                await viewModel.createReview()
                            }
                        }
                    }
                }
            }
            
            if viewModel.isGetPostDataLoading {
                CustomLoadingView(titleText: "불러오는 중입니다.", isLoading: viewModel.isGetPostDataLoading)
            }
            
            if viewModel.isLoadingGetPostSuccess == false {
                CustomPopupView(titleText: "네트워크 에러", buttonText: "재요청", tapGesture: {
                    viewModel.isLoadingGetPostSuccess = true
                    
                    Task {
                        await viewModel.loadInitialData()
                    }
                }, cancelButtonText: "돌아가기") {
                    self.presentationMode.wrappedValue.dismiss()
                }
            }
        }
        .navigationViewStyle(.stack)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden()
        .onAppear {
            Task {
                await viewModel.loadInitialData()
            }
        }
    }
}

#Preview {
    PostDetailView(viewModel: PostDetailViewModel(postId: 1))
}
