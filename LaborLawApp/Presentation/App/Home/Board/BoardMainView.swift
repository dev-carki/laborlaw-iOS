//
//  BoardMainView.swift
//  LaborLawApp
//
//  Created by Carki on 1/20/26.
//

import SwiftUI

struct BoardMainView: View {
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
                    
                    Spacer()
                }
            }
        }
        .navigationViewStyle(.stack)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    BoardMainView()
}
