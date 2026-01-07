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
                    
                    TopBarView(type: .back, text: "법 선택") {
                        self.presentationMode.wrappedValue.dismiss()
                        viewModel.signUpViewModel.createUser.interestedLaws.removeAll()
                    }
                    
                    TitledSection(title: "관심있는 법 선택 (다중선택 가능)") {
                        VStack(spacing: 16) {
                            ForEach(LawCode.allCases.chunked(into: 2), id: \.self) { row in
                                HStack(spacing: 4) {
                                    ForEach(row, id: \.self) { law in
                                        CustomCheckBox(
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
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 16)
                    
                    Spacer()
                    
                    CustomButton(text: "완료") {
                        print(viewModel.signUpViewModel.createUser)
                        
                        Task {
                            await viewModel.createUser()
                        }
                    }
                    .padding(.horizontal, 16)
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
