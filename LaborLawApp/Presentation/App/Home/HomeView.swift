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
                    
                    TopBarView(type: .none, text: "홈", rightIconName: "gearshape") {
                        
                    } onRightTap: {
                        self.coordinator.push(destination: .setting)
                    }
                    
                    VStack(spacing: 12) {
                        HStack(spacing: 24) {
                            ContentsBoxButton(iconName: "brain.head.profile.fill", text: "법률 챗봇")
                                .onTapGesture {
                                    self.coordinator.push(destination: .chatList)
                                }
                            ContentsBoxButton(iconName: "person.wave.2.fill", text: "Q&A 게시판")
                                .onTapGesture {
                                    self.coordinator.push(destination: .boardMain)
                                }
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        
                        ScrollView(showsIndicators: false) {
                            VStack {
                                
                            }
                            .padding(.horizontal, 16)
                        }
                        .frame(maxWidth: .infinity)
                        .background(CustomColor.customGray500)
                        .setCornerRadius(16, corners: [.topLeft, .topRight])
                        .ignoresSafeArea()
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
