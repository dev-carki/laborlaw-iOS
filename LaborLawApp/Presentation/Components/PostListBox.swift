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
        HStack(spacing: 12) {
            VStack(spacing: 12) {
                Text(data.title)
                    .font(Font.chatBoxTitleText)
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
                        .font(Font.chatBoxDateText)
                }
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
    PostListBox(data: PostList(id: 1, title: "title", category: 3, createdAt: ""))
}
