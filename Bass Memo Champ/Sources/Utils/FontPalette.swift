//
//  FontPalette.swift
//  Bass Memo Champ
//
//  Created by Андрей Сторожко on 09.09.2024.
//

import SwiftUI

enum FontPalette {
    case hTwo
    case hThree
    case sign
    case search
    case delete
    
    var font: Font {
        switch self {
        case .hTwo:
            return .system(size: 48, weight: .heavy)
        case .hThree:
            return .system(size: 42, weight: .heavy)
        case .sign:
            return .system(size: 32, weight: .heavy)
        case .search:
            return .system(size: 24, weight: .semibold, design: .rounded)
        case .delete:
            return .system(size: 16, weight: .bold, design: .rounded)
        }
    }
}
