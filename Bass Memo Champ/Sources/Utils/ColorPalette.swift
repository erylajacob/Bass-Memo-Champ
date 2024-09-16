//
//  ColorPalette.swift
//  Bass Memo Champ
//
//  Created by Андрей Сторожко on 09.09.2024.
//

import UIKit
import SwiftUI

enum ColorPalette {
    case mainButtonBackground
    case mainButtonShadowColor
    
    case additionalButtonBackground
    case additionalButtonShadowColor
    
    case selectLevelButton

    case logOutButtonBackground
    case logOutButtonShadowColor
    
    case levelBackgroundColor
    case notResolvedLevelShadowColor
    
    case darkBlueText
    case whiteText
    
    case shadowColor

    var uiColor: UIColor {
        switch self {
        case .mainButtonBackground:
            return .init(red: 244, green: 138, blue: 100, alpha: 1) //#F48A64
        case .mainButtonShadowColor:
            return .init(red: 237, green: 105, blue: 90, alpha: 1) //#ED695A
        case .additionalButtonBackground:
            return .init(red: 252, green: 249, blue: 128, alpha: 1) //#FCF980
        case .additionalButtonShadowColor:
            return .init(red: 250, green: 213, blue: 119, alpha: 1) //#FAD577
            
        case .logOutButtonBackground:
            return .init(red: 252, green: 245, blue: 128, alpha: 1) //#FCF580
        case .logOutButtonShadowColor:
            return .init(red: 251, green: 217, blue: 121, alpha: 1) //#FBD979
            
        case .levelBackgroundColor:
            return .init(red: 252, green: 243, blue: 128, alpha: 1) //#FCF380
        case .notResolvedLevelShadowColor:
            return .init(red: 251, green: 221, blue: 122, alpha: 1) //#FBDD7A

        case .darkBlueText:
            return .init(red: 8, green: 21, blue: 55, alpha: 1) //#081537
        case .whiteText:
            return .init(white: 1, alpha: 1)
        case .shadowColor:
            return .init(white: 0, alpha: 0.25)
        case .selectLevelButton:
            return .init(red: 250, green: 193, blue: 76, alpha: 1) //#FAC14C
        }
    }
    
    var color: Color {
        return .init(uiColor: uiColor)
    }
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int, alpha: CGFloat) {
        self.init(red: CGFloat(red) / 255, green: CGFloat(green) / 255, blue: CGFloat(blue) / 255, alpha: alpha)
    }
}
