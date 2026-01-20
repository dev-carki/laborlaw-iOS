//
//  CategoryDropdownView.swift
//  LaborLawApp
//
//  Created by Carki on 1/20/26.
//

import SwiftUI

struct CategoryDropdownView: View {
    let items: [PostCategory]
    let onSelect: (PostCategory) -> Void
    
    var body: some View {
        VStack(spacing: 0) {
            ForEach(items) { item in
                Button {
                    onSelect(item)
                } label: {
                    HStack {
                        Text(item.name)
                            .foregroundColor(.black)
                        Spacer()
                    }
                    .padding(12)
                }
                
                if item != items.last {
                    Divider()
                }
            }
        }
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .shadow(color: .black.opacity(0.15), radius: 8)
        )
        .frame(maxWidth: 300)
    }
}

#Preview {
    CategoryDropdownView(items: [PostCategory(serverId: 0, name: "alal")]) { item in
        
    }
}
