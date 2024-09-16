//
//  MainButtonLayout.swift
//  Bass Memo Champ
//
//  Created by Андрей Сторожко on 09.09.2024.
//

import Foundation
import SwiftUI

public struct MainButtonLayout {
    // MARK: - Properties
    let contentVerticalPadding: CGFloat
    let contentHorizontalPadding: CGFloat
    
    let maxWidth: CGFloat
    
    init(
        contentVerticalPadding: CGFloat,
        contentHorizontalPadding: CGFloat,
        maxWidth: CGFloat
    ) {
        self.contentVerticalPadding = contentVerticalPadding
        self.contentHorizontalPadding = contentHorizontalPadding
        self.maxWidth = maxWidth
    }
}

// MARK: - Catalog values
public extension MainButtonLayout {
    static let regular: MainButtonLayout = MainButtonLayout(
        contentVerticalPadding: 8,
        contentHorizontalPadding: 48,
        maxWidth: .infinity
    )
    
    static let sign: MainButtonLayout = MainButtonLayout(
        contentVerticalPadding: 24,
        contentHorizontalPadding: 48,
        maxWidth: .infinity
    )
    
    static let logOut: MainButtonLayout = MainButtonLayout(
        contentVerticalPadding: 12,
        contentHorizontalPadding: 48,
        maxWidth: .infinity
    )
    
    static let main: MainButtonLayout = MainButtonLayout(
        contentVerticalPadding: 24,
        contentHorizontalPadding: 24,
        maxWidth: .infinity
    )
}
