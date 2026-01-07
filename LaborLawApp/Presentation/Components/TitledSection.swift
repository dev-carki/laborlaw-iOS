//
//  TitledSection.swift
//  LaborLawApp
//
//  Created by Carki on 1/7/26.
//

import SwiftUI

struct TitledSection<Content: View>: View {

    let title: String
    let content: Content

    init(
        title: String,
        @ViewBuilder content: () -> Content
    ) {
        self.title = title
        self.content = content()
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(title)
                .font(Font.topbarViewText)
                .foregroundColor(CustomColor.customBlack)
                .padding(.horizontal, 8)

            Rectangle()
                .frame(height: 1)
                .foregroundColor(CustomColor.customGray400)
                .padding(.top, 4)

            content
                .padding(.top, 8)
                .padding(.horizontal, 8)
        }
    }
}


#Preview {
    TitledSection(title: "성별") {
        HStack {
            Text("남자")
            Text("여자")
        }
    }
}
