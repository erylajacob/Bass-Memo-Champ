//
//  LevelItemViewModel.swift
//  Bass Memo Champ
//
//  Created by Андрей Сторожко on 10.09.2024.
//

import Foundation

final class LevelItemViewModel: ObservableObject, Hashable {
    @Published var id: String
    @Published var level: Int
    @Published var cardsCount: Int
    @Published var isResolved: Bool
    
    init(id: String, level: Int, cardsCount: Int, isResolved: Bool) {
        self.id = id
        self.level = level
        self.cardsCount = cardsCount
        self.isResolved = isResolved
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: LevelItemViewModel, rhs: LevelItemViewModel) -> Bool {
        return lhs.id == rhs.id &&
            lhs.level == rhs.level &&
            lhs.cardsCount == rhs.cardsCount &&
            lhs.isResolved == rhs.isResolved
    }
}
