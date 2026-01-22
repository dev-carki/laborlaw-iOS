//
//  PostListBox.swift
//  LaborLawApp
//
//  Created by Carki on 1/21/26.
//

import SwiftUI

struct PostListBox: View {
    let data: PostList
    
    private var category: PostCategoryEnum? {
        PostCategoryEnum(rawValue: data.category)
    }
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Rectangle()
                .foregroundColor(category?.color ?? CustomColor.customGray300)
                .frame(width: 2)
                .frame(maxHeight: .infinity)
            
            VStack(spacing: 12) {
                Text(data.nickName)
                    .font(Font.postListNickNameText)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(data.title)
                    .lineLimit(1)
                    .font(Font.postListTitleText)
                    .foregroundColor(CustomColor.customGray700)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack {
                    if let category = category {
                        Text(category.title)
                            .font(Font.categoryTextBadge)
                            .foregroundColor(.white)
                            .padding(.all, 6)
                            .background(category.color)
                            .clipShape(Capsule())
                    } else {
                        Text("알 수 없음")
                            .font(Font.categoryTextBadge)
                            .foregroundColor(.white)
                            .padding(.all, 6)
                            .background(CustomColor.customGray300)
                            .clipShape(Capsule())
                    }
                    
                    Spacer()
                    
                    Text(data.createdAt)
                        .foregroundColor(CustomColor.customDarkgray)
                        .font(Font.chatBoxDateText)
                }
            }
        }
        .background(CustomColor.customWhite)
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    PostListBox(data: PostList(id: 1, nickName: "nickname", title: "titaslkdfjnasdjflsadjflisajflisdjafilsjafiljsdilfjsaildfjsiladfjlijle", category: 3, createdAt: "2021"))
}
