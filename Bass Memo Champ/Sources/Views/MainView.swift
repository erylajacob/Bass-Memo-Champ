//
//  MainView.swift
//  Bass Memo Champ
//
//  Created by Андрей Сторожко on 09.09.2024.
//

import SwiftUI

struct MainView: View {
    private var text: String
    private let style: MainTextFieldStyle
    private let layout: MainViewLayout
    
    init(text: String, style: MainTextFieldStyle, layout: MainViewLayout) {
        self.text = text
        self.style = style
        self.layout = layout
    }
    
    var body: some View {
        HStack {
            Text(text)
            .textCase(.uppercase)
            .multilineTextAlignment(.center)
            .font(FontPalette.search.font)
            .foregroundStyle(ColorPalette.darkBlueText.color)
            .padding(.vertical, 16)
            .padding(.horizontal, 24)
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 48)
                .foregroundStyle(Color.white)
                .shadow(color: ColorPalette.shadowColor.color, radius: 4, x: 0, y: 4)
            )
        }
    }
}

#Preview {
    MainView(text: "123", style: .dark, layout: .main)
}
