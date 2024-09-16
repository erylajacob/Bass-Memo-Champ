//
//  LevelCompleteViewModel.swift
//  Bass Memo Champ
//
//  Created by Андрей Сторожко on 09.09.2024.
//

import Foundation

final class LevelCompleteViewModel: ObservableObject {
    @Published var attemptCounter: Int = 0
    
    init(attemptCounter: Int) {
        self.attemptCounter = attemptCounter
    }

    
    static func == (lhs: LevelCompleteViewModel, rhs: LevelCompleteViewModel) -> Bool {
        return lhs.attemptCounter == rhs.attemptCounter
    }
}
