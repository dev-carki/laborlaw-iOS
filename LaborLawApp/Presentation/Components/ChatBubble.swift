//
//  ChatBubble.swift
//  LaborLawApp
//
//  Created by Carki on 1/11/26.
//

import SwiftUI

struct ChatBubble: View {

    let message: ChatMessage

    var body: some View {
        HStack {
            if message.role == .ai {
                bubble
                Spacer()
            } else {
                Spacer()
                bubble
            }
        }
    }

    private var bubble: some View {
        VStack(alignment: message.role == .ai ? .leading : .trailing, spacing: 8) {
            Text(message.role.roleName)
                .font(Font.chatText)
                .foregroundColor(CustomColor.customBlack)
            
            Text(message.text)
                .font(Font.chatText)
                .padding(12)
                .background(message.role == .ai ? Color.gray.opacity(0.2) : Color.blue)
                .foregroundColor(message.role == .ai ? CustomColor.customBlack : CustomColor.customWhite)
                .cornerRadius(16)
                .animation(.linear(duration: 0.05), value: message.text)
        }
    }
}

#Preview {
    VStack {
        ChatBubble(message: ChatMessage(role: .user, text: "asdfasdfasdfasdfasdfasdfsadfasdfasdfasdfasdfasdfasdfasdfadsf", state: .done))
        ChatBubble(message: ChatMessage(role: .ai, text: "asdfasdfasdfasdfasdfasdfsadfasdfasdfasdfasdfasdfasdfasdfadsf", state: .loading))
        ChatBubble(message: ChatMessage(role: .user, text: "asdfasdfasdfasdfasdfasdfsadfasdfasdfasdfasdfasdfasdfasdfadsf", state: .done))
        ChatBubble(message: ChatMessage(role: .ai, text: "asdfasdfasdfasdfasdfasdfsadfasdfasdfasdfasdfasdfasdfasdfaasoidjfioasdjfoiasdjoifjasidofjoisadjfioasdjfioasjdiofjasdiofjiosadfjioasdjfioasdjiofjasidofjdsf", state: .streaming))
    }
}
