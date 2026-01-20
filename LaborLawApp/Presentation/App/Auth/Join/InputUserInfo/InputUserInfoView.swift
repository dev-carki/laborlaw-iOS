//
//  InputUserInfoView.swift
//  LaborLawApp
//
//  Created by Carki on 1/7/26.
//

import SwiftUI

struct InputUserInfoView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var viewModel: InputUserInfoViewModel
    @StateObject var coordinator = Coordinator()
    
    init(viewModel: InputUserInfoViewModel) {
        self.viewModel = viewModel
    }
    
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 0) {
                    coordinator.navigationLinkSection()
                    
                    TopBarView(type: .back, text: "회원가입") {
                        self.presentationMode.wrappedValue.dismiss()
                        viewModel.dismiss()
                        
                    }
                    
                    VStack(spacing: 16) {
                        TitledSection(title: "성별") {
                            HStack(spacing: 12) {
                                CustomRadioButton(text: "남자", isSelected: viewModel.gender == .male)
                                    .onTapGesture {
                                        viewModel.gender = .male
                                        self.viewModel.signUpViewModel.createUser.gender = viewModel.gender
                                    }
                                CustomRadioButton(text: "여자", isSelected: viewModel.gender == .female)
                                    .onTapGesture {
                                        viewModel.gender = .female
                                        self.viewModel.signUpViewModel.createUser.gender = viewModel.gender
                                    }
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        TitledSection(title: "나이 (선택)") {
                            HStack(spacing: 12) {
                                CustomTextField(inputText: $viewModel.ageText, keyboardType: .numberPad, placeHolderText: "0 ~ 99", iconName: nil)
                                    .frame(width: 80)
                                    .onChange(of: $viewModel.ageText.wrappedValue) {
                                        $viewModel.ageText.wrappedValue = $0.textFieldTextlimited(to: 2)
                                        self.viewModel.signUpViewModel.createUser.age = viewModel.ageText
                                    }
                                
                                Text("세")
                                    .font(Font.topbarViewText)
                                    .foregroundColor(CustomColor.customBlack)
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 16)
                        
                        TitledSection(title: "연봉") {
                            VStack(spacing: 16) {
                                ForEach(SalaryRange.allCases.chunked(into: 2), id: \.self) { row in
                                    HStack(spacing: 4) {
                                        ForEach(row, id: \.self) { range in
                                            CustomRadioButton(
                                                text: range.displayName,
                                                isSelected: viewModel.salary == range
                                            )
                                            .onTapGesture {
                                                viewModel.salary = range
                                                self.viewModel.signUpViewModel.createUser.salaryRange = viewModel.salary
                                            }
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        }
                                    }
                                }
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 16)
                        
                        TitledSection(title: "직군") {
                            HStack(spacing: 12) {
                                CustomTextField(inputText: $viewModel.industryText, placeHolderText: "예: IT / 디자인 / 기획", iconName: nil)
                                    .frame(width: 150)
                                    .onChange(of: $viewModel.industryText.wrappedValue) {
                                        self.viewModel.signUpViewModel.createUser.industry = viewModel.industryText
                                    }
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 16)
                        
                        TitledSection(title: "고용형태") {
                            VStack(spacing: 16) {
                                ForEach(EmploymentType.allCases.chunked(into: 2), id: \.self) { row in
                                    HStack(spacing: 4) {
                                        ForEach(row, id: \.self) { type in
                                            CustomRadioButton(
                                                text: type.displayName,
                                                isSelected: viewModel.employment == type
                                            )
                                            .onTapGesture {
                                                viewModel.employment = type
                                                self.viewModel.signUpViewModel.createUser.employmentType = viewModel.employment
                                            }
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        }
                                    }
                                }
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 16)
                        
                        Spacer()
                        
                        CustomButton(text: "다음") {
                            
                            
                            
                            self.coordinator.push(destination: .selectLaw(signUpViewModel: self.viewModel.signUpViewModel))
                        }
                        .padding(.horizontal, 16)
                    }
                }
            }
        }
        .onAppear {
            print(viewModel.signUpViewModel.createUser)
        }
        .navigationViewStyle(.stack)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden()
    }
    
}

#Preview {
    InputUserInfoView(viewModel: InputUserInfoViewModel(signUpViewModel: SignUpViewModel()))
}
