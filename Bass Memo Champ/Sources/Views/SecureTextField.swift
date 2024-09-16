//
//  SecureTextField.swift
//  Bass Memo Champ
//
//  Created by Андрей Сторожко on 09.09.2024.
//

import SwiftUI

struct SecureTextField: View {
    private var text: Binding<String>
    private let placeholder: String
    private let style: MainTextFieldStyle
    
    init(text: Binding<String>, placeholder: String, style: MainTextFieldStyle) {
        self.text = text
        self.placeholder = placeholder
        self.style = style
    }
        
    var body: some View {
        SecureField("",
                  text: text,
                  prompt: Text(placeholder)
                            .font(FontPalette.search.font)
                            .foregroundColor(ColorPalette.darkBlueText.color)
        )
        .textCase(.uppercase)
        .multilineTextAlignment(.center)
        .font(FontPalette.search.font)
        .foregroundStyle(ColorPalette.darkBlueText.color)
        .padding(.vertical, 16)
        .padding(.horizontal, 24)
        .background(
            RoundedRectangle(cornerRadius: 48)
            .foregroundStyle(Color.white)
            .shadow(color: ColorPalette.shadowColor.color, radius: 4, x: 0, y: 4)
        )
        
//        SecureField("",
//                  text: text,
//                  prompt: Text(placeholder)
//                            .font(FontPalette.search.font)
//                            .foregroundColor(ColorPalette.buttonText.color)
//        )
//        .textCase(.uppercase)
//        .font(FontPalette.search.font)
//        .foregroundStyle(ColorPalette.buttonText.color)
//        .padding(24)
//        .background(
//            RoundedRectangle(
//                cornerSize: .init(width: 20, height: 20)
//            )
//            .foregroundStyle(Color.white)
//            .shadow(color: ColorPalette.shadowColor.color, radius: 3, x: 2, y: 4)
//        )
//        .overlay(
//            RoundedRectangle(
//                cornerSize: .init(width: 20, height: 20)
//            )
//            .stroke(ColorPalette.buttonBackground.color, lineWidth: 1)
//        )
    }
}
