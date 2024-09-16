//
//  MainTextField.swift
//  Bass Memo Champ
//
//  Created by Андрей Сторожко on 09.09.2024.
//

import SwiftUI

struct MainTextField: View {
    private var text: Binding<String>
    private let placeholder: String
    
    init(text: Binding<String>, placeholder: String) {
        self.text = text
        self.placeholder = placeholder
    }
        
    var body: some View {
        TextField("",
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
    }
}

#Preview {
    MainTextField(
        text: .constant("EMAIL... "),
        placeholder: "Search..."
    )
    .padding(20)
}

struct GlowBorder: ViewModifier {
    var color: Color
    var lineWidth: Int
    
    func body(content: Content) -> some View {
        applyShadow(content: AnyView(content), lineWidth: lineWidth)
    }
    
    func applyShadow(content: AnyView, lineWidth: Int) -> AnyView {
        if lineWidth == 0 {
            return content
        } else {
            return applyShadow(content: AnyView(content.shadow(color: color, radius: 1)), lineWidth: lineWidth - 1)
        }
    }
}

//extension View {
//    func glowBorder(color: Color, lineWidth: Int) -> some View {
//        self.modifier(GlowBorder(color: color, lineWidth: lineWidth))
//    }
//}
