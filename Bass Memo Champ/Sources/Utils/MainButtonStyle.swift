//
//  MainButtonStyle.swift
//  Bass Memo Champ
//
//  Created by Андрей Сторожко on 09.09.2024.
//

import UIKit

public struct MainButtonStyle {
    // MARK: - Properties
    let backgroundColor: ColorPalette
    let textColor: ColorPalette
    let shadowColor: ColorPalette

    init(backgroundColor: ColorPalette, textColor: ColorPalette, shadowColor: ColorPalette) {
        self.backgroundColor = backgroundColor
        self.textColor = textColor
        self.shadowColor = shadowColor
    }
}

// MARK: - Catalog values
public extension MainButtonStyle {
    static let main: MainButtonStyle = MainButtonStyle(
        backgroundColor: .mainButtonBackground,
        textColor: .whiteText,
        shadowColor: .mainButtonShadowColor
    )
    
    static let additional: MainButtonStyle = MainButtonStyle(
        backgroundColor: .additionalButtonBackground,
        textColor: .darkBlueText,
        shadowColor: .additionalButtonShadowColor
    )
    
    static let selectLevel: MainButtonStyle = MainButtonStyle(
        backgroundColor: .selectLevelButton,
        textColor: .whiteText,
        shadowColor: .mainButtonShadowColor
    )
}

