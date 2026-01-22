//
//  CustomReviewBox.swift
//  LaborLawApp
//
//  Created by Carki on 1/22/26.
//

import SwiftUI


struct CustomReviewBox: View {
    let data: PostReviewList
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(data.nickName)
                .foregroundColor(CustomColor.customDarkgray)
                .font(Font.chatBoxDateText)
            
            Text(data.contentText)
                .foregroundColor(CustomColor.customBlack)
                .font(Font.chatBoxDateText)
                .multilineTextAlignment(.leading)
            
            Text(data.createdAt)
                .foregroundColor(CustomColor.customDarkgray)
                .font(Font.chatBoxDateText)
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(CustomColor.customWhite)
        .overlay(
            Rectangle()
                .frame(height: 1)
                .foregroundColor(CustomColor.customGray300),
            alignment: .top
        )
    }
}

#Preview {
    CustomReviewBox(data: PostReviewList(serverId: 0, contentText: "힘내십쇼", nickName: "팀장", createdAt: "2025-11-13"))
}
