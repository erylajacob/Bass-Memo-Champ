//
//  GameDomainModel.swift
//  Bass Memo Champ
//
//  Created by Андрей Сторожко on 09.09.2024.
//

import Foundation
import RealmSwift

struct GameDomainModel {
    var id: UUID
    var level: Int
    var totalPairs: Int
    var isResolved: Bool
    var attemptСounter: Int
        
    init(id: UUID = .init(),
         level: Int = 0,
         totalPairs: Int = 0,
         isResolved: Bool = false,
         attemptСounter: Int = 0
    ) {
        self.id = id
        self.level = level
        self.totalPairs = totalPairs
        self.isResolved = isResolved
        self.attemptСounter = attemptСounter
    }
}
