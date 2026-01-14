//
//  HomeView.swift
//  LaborLawApp
//
//  Created by Carki on 1/10/26.
//

import SwiftUI

struct HomeView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject var coordinator = Coordinator(isRoot: true)
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 0) {
                    coordinator.navigationLinkSection()
                    
                    TopBarView(type: .none, text: "") {
                        
                    }
                    
                    CustomButton(text: "채팅뷰") {
                        self.coordinator.push(destination: .chatList)
                    }
                }
            }
        }
        .navigationViewStyle(.stack)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    HomeView()
}
