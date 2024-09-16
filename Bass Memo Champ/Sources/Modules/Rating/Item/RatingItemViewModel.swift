//
//  RatingItemViewModel.swift
//  Bass Memo Champ
//
//  Created by Андрей Сторожко on 10.09.2024.
//

import Foundation

final class RatingItemViewModel: ObservableObject, Hashable {
    @Published var id: String
    @Published var level: Int
    @Published var attemptСounter: Int
    
    init(id: String, level: Int, attemptСounter: Int) {
        self.id = id
        self.level = level
        self.attemptСounter = attemptСounter
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: RatingItemViewModel, rhs: RatingItemViewModel) -> Bool {
        return lhs.id == rhs.id &&
            lhs.level == rhs.level &&
            lhs.attemptСounter == rhs.attemptСounter
    }
}
