//
//  SelectLawView.swift
//  LaborLawApp
//
//  Created by Carki on 1/7/26.
//

import SwiftUI

struct SelectLawView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var viewModel: SelectLawViewModel
    @StateObject var coordinator = Coordinator()
    
    init(viewModel: SelectLawViewModel) {
        self.viewModel = viewModel
    }
    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 0) {
                    coordinator.navigationLinkSection()
                    
                    TopBarView(type: .back, text: "회원가입") {
                        self.presentationMode.wrappedValue.dismiss()
                        viewModel.signUpViewModel.createUser.interestedLaws.removeAll()
                    }
                    
                    VStack(spacing: 16) {
                        VStack(alignment: .leading, spacing: 12) {
                            Text("관심있는 법을 모두 선택해주세요.")
                                .font(Font.titleText)
                                .foregroundColor(CustomColor.customBlack)
                            
                            Text("선택한 법에 중점을 맞춘\n챗봇 서비스가 제공됩니다.")
                                .font(Font.subTitleText)
                                .foregroundColor(CustomColor.customGray700)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ForEach(LawCode.allCases.chunked(into: 2), id: \.self) { row in
                            HStack(spacing: 12) {
                                ForEach(row, id: \.self) { law in
                                    SelectBox(
                                        iconName: law.icon,
                                        text: law.displayName,
                                        isSelected: viewModel.selectedLawCodes.contains(law)
                                    )
                                    .onTapGesture {
                                        viewModel.toggleLawCode(law)
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                }
                            }
                        }
                    }
                    .padding(.top, 16)
                    .padding(.horizontal, 16)
                    
                    Spacer()
                    
                    CustomButton(text: "완료") {
                        print(viewModel.signUpViewModel.createUser)
                        
                        Task {
                            await viewModel.createUser()
                        }
                    }
                    .padding(.horizontal, 16)
                }
                
                CustomLoadingView(titleText: "생성중입니다.", isLoading: viewModel.isUserCreating)
                
                if viewModel.isUserCreatingSuccess {
                    CustomPopupView(titleText: "계정 생성 완료", buttonText: "홈으로 이동") {
                        self.coordinator.moveToLogin()
                    }
                }
            }
        }
        .onAppear {
            print(viewModel.selectedLawCodes)
            print(viewModel.signUpViewModel.createUser)
        }
        .navigationViewStyle(.stack)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    SelectLawView(viewModel: SelectLawViewModel(signUpViewModel: SignUpViewModel()))
}
