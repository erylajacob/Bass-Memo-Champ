//
//  MainTextFieldStyle.swift
//  Bass Memo Champ
//
//  Created by Андрей Сторожко on 09.09.2024.
//

import Foundation
import UIKit

public struct MainTextFieldStyle {
    // MARK: - Properties
    let textColor: ColorPalette
    let textBorderColor: ColorPalette
    let borderColor: ColorPalette

    init(textColor: ColorPalette, textBorderColor: ColorPalette, borderColor: ColorPalette) {
        self.textColor = textColor
        self.textBorderColor = textBorderColor
        self.borderColor = borderColor
    }
}

// MARK: - Catalog values
public extension MainTextFieldStyle {
    static let light: MainTextFieldStyle = MainTextFieldStyle(
        textColor: .mainButtonBackground,
        textBorderColor: .mainButtonBackground,
        borderColor: .mainButtonBackground
    )
    
    static let dark: MainTextFieldStyle = MainTextFieldStyle(
        textColor: .mainButtonBackground,
        textBorderColor: .mainButtonBackground,
        borderColor: .mainButtonBackground
    )
}
