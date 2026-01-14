//
//  ChatListBox.swift
//  LaborLawApp
//
//  Created by Carki on 1/14/26.
//

import SwiftUI

struct ChatListBox: View {
    let titleText: String
    let dateText: String
    
    var body: some View {
        HStack(spacing: 12) {
            VStack(spacing: 12) {
                Text(titleText)
                    .font(Font.chatBoxTitleText)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(dateText)
                    .font(Font.chatBoxDateText)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            
            VStack {
                Image(systemName: "chevron.right")
//                    .resizable()
                    .padding(.all, 4)
            }
            .frame(width: 24, height: 24)
        }
        .padding(.all, 8)
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    ChatListBox(titleText: "상해를 입으면?", dateText: "2025년 12월 1일")
}
