//
//  MainButton.swift
//  Bass Memo Champ
//
//  Created by Андрей Сторожко on 09.09.2024.
//

import SwiftUI

struct MainButton: View {
    private let text: String
    private let fullWidth: Bool
    private let fontPalette: FontPalette
    private let layout: MainButtonLayout
    private let style: MainButtonStyle
    private let cornerRadius: CGFloat
    private let action: () -> Void
    
    init(
        text: String,
        fullWidth: Bool = false,
        fontPalette: FontPalette,
        layout: MainButtonLayout,
        style: MainButtonStyle,
        cornerRadius: CGFloat,
        action: @escaping () -> Void
    ) {
        self.text = text
        self.fullWidth = fullWidth
        self.fontPalette = fontPalette
        self.layout = layout
        self.style = style
        self.cornerRadius = cornerRadius
        self.action = action
    }
        
    var body: some View {
        Button(
            action: {
                action()
            },
            label: {
                Text(text)
                    .lineLimit(1)
                    .font(fontPalette.font)
                    .foregroundStyle(style.textColor.color)
                    .minimumScaleFactor(0.5)
                    .foregroundStyle(.white)
                    .if(fullWidth) {
                        $0.frame(maxWidth: .infinity)
                    }
            }
        )
        .padding(.horizontal, layout.contentHorizontalPadding)
        .padding(.vertical, layout.contentVerticalPadding)
        .background(
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(
                    LinearGradient(
                        gradient: Gradient(
                            colors: [
                                style.backgroundColor.color,
                                style.shadowColor.color
//                                ColorPalette.mainButtonBackground.color,
//                                ColorPalette.mainButtonShadowColor.color
                            ]
                        ),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
        )
//        .fixedSize(horizontal: false, vertical: true)
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    MainButton(text: "SIGN IN", fontPalette: .sign, layout: .regular, style: .main, cornerRadius: 52, action: {})
//        .padding(.horizontal, 20)
}

//struct MainButton: View {
//    private let text: String
//    private let fontPalette: FontPalette
//    private let layout: MainButtonLayout
//    private let action: () -> Void
//
//    init(
//        text: String,
//        fontPalette: FontPalette,
//        layout: MainButtonLayout,
//        action: @escaping () -> Void
//    ) {
//        self.text = text
//        self.fontPalette = fontPalette
//        self.layout = layout
//        self.action = action
//    }
//
//    var body: some View {
//        Button(
//            action: {
//                action()
//            },
//            label: {
//                Text(text)
//                    .lineLimit(2)
//                    .font(fontPalette.font)
//                    .minimumScaleFactor(0.5)
//                    .foregroundStyle(ColorPalette.borderPink.color)
//                    .glowBorder(color: ColorPalette.textBorderBurgundy.color, lineWidth: 5)
//                    .frame(maxWidth: layout.maxWidth, maxHeight: layout.maxHeight)
//                    .background(
//                        Circle()
//                            .foregroundStyle(.white)
//                            .shadow(color: ColorPalette.startButtonShadow.color, radius: 8, x: 0, y: 0)
//                    )
//                    .overlay(
//                        Circle()
//                        .stroke(style: .init(lineWidth: 8, lineCap: .round, dash: [20]))
//                        .fill(ColorPalette.borderPink.color)
//                    )
//            }
//        )
//        .padding(.horizontal, layout.contentHorizontalPadding)
//        .padding(.vertical, layout.contentVerticalPadding)
//    }
//}
//
//#Preview {
//    MainButton(text: "test test", fontPalette: .hTwo, layout: .circle, action: {})
//}
