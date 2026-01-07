//
//  Destination.swift
//  LaborLawApp
//
//  Created by Carki on 1/7/26.
//

import SwiftUI

enum Destination {
    case login
    case inputIDPW
    case inputUserInfo(signUpViewModel: SignUpViewModel)
    case selectLaw(signUpViewModel: SignUpViewModel)
//    case home
//    case showMenuBoard
//    case createMenuBoard
//    case addMenuItem(categoryToEdit: MenuCategory? = nil, onComplete: (MenuCategory) -> Void)
    
//    case policy(onClickAgree: () -> (), type: PolicyType)
    
    @ViewBuilder
    var view: some View {
        switch self {
        case .login:
            LoginView()
        case .inputIDPW:
            InputIDPWView()
        case .inputUserInfo(var signUpVieModel):
            InputUserInfoView(viewModel: InputUserInfoViewModel(signUpViewModel: signUpVieModel))
        case .selectLaw(var signUpVieModel):
            SelectLawView(viewModel: SelectLawViewModel(signUpViewModel: signUpVieModel))
//        case .join:
//            CreateStoreView()
//            
//        case .home:
//            MainView()
//            
//        case .showMenuBoard:
//            MenuBoardView()
//            
//        case .createMenuBoard:
//            CreateMenuBoardView()
//            
//        case .addMenuItem(let categoryToEdit, let onComplete):
//            AddMenuItemView(categoryToEdit: categoryToEdit, onComplete: onComplete)
//        case .policy(let onClickAgree, let type):
//            PolicyView(vm: PolicyVM(type: type), onClickAgree: onClickAgree)
        }
    }
}
