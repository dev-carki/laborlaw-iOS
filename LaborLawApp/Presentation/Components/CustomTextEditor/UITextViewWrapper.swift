//
//  UITextViewWrapper.swift
//  LaborLawApp
//
//  Created by Carki on 1/20/26.
//

import SwiftUI
import UIKit

struct UITextViewWrapper: UIViewRepresentable {
    @Binding var text: String
    let placeholder: String

    @Binding var calculatedHeight: CGFloat
    let maxHeight: CGFloat
    let maxTextLength: Int

    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()

        textView.delegate = context.coordinator
        textView.font = UIFont.inputText
        textView.textColor = UIColor(CustomColor.customBlack)
        textView.isScrollEnabled = true
        textView.backgroundColor = .clear
        textView.textContainerInset = .zero
        textView.textContainer.lineFragmentPadding = 0

        // placeholder 라벨
        let placeholderLabel = UILabel()
        placeholderLabel.text = placeholder
        placeholderLabel.textColor = UIColor(CustomColor.customGray400)
        placeholderLabel.font = UIFont.placeholderText
        placeholderLabel.numberOfLines = 0
        placeholderLabel.translatesAutoresizingMaskIntoConstraints = false
        placeholderLabel.tag = 999

        textView.addSubview(placeholderLabel)

        NSLayoutConstraint.activate([
            placeholderLabel.topAnchor.constraint(equalTo: textView.topAnchor, constant: 2),
            placeholderLabel.leadingAnchor.constraint(equalTo: textView.leadingAnchor, constant: 4),
            placeholderLabel.trailingAnchor.constraint(equalTo: textView.trailingAnchor),
        ])

        placeholderLabel.isHidden = !text.isEmpty

        return textView
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        if uiView.text != text {
            uiView.text = text
        }

        if let placeholderLabel = uiView.viewWithTag(999) as? UILabel {
            placeholderLabel.isHidden = !text.isEmpty
        }

        UITextViewWrapper.recalculateHeight(
            view: uiView,
            result: $calculatedHeight,
            maxHeight: maxHeight
        )
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    static func recalculateHeight(
        view: UITextView,
        result: Binding<CGFloat>,
        maxHeight: CGFloat
    ) {
        let size = view.sizeThatFits(
            CGSize(width: view.frame.width, height: .greatestFiniteMagnitude)
        )

        DispatchQueue.main.async {
            result.wrappedValue = min(size.height, maxHeight)
        }
    }
}

extension UITextViewWrapper {
    class Coordinator: NSObject, UITextViewDelegate {
        var parent: UITextViewWrapper

        init(_ parent: UITextViewWrapper) {
            self.parent = parent
        }

        // 입력 제한 (타이핑 + 붙여넣기 포함)
        func textView(
            _ textView: UITextView,
            shouldChangeTextIn range: NSRange,
            replacementText text: String
        ) -> Bool {
            let currentText = textView.text ?? ""
            guard let stringRange = Range(range, in: currentText) else {
                return false
            }

            let updatedText = currentText.replacingCharacters(
                in: stringRange,
                with: text
            )

            return updatedText.count <= parent.maxTextLength
        }

        func textViewDidChange(_ textView: UITextView) {
            parent.text = textView.text

            if let placeholderLabel = textView.viewWithTag(999) as? UILabel {
                placeholderLabel.isHidden = !textView.text.isEmpty
            }

            UITextViewWrapper.recalculateHeight(
                view: textView,
                result: parent.$calculatedHeight,
                maxHeight: parent.maxHeight
            )

            // 커서 위치 자동 스크롤
            textView.scrollRangeToVisible(textView.selectedRange)
        }
    }
}
