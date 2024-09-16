//
//  RealmDomainModel.swift
//  Bass Memo Champ
//
//  Created by Андрей Сторожко on 09.09.2024.
//

import Foundation
import RealmSwift

final class RealmDomainModel: Object {
    @Persisted(primaryKey: true)  var id: UUID = .init()
    @Persisted var level: Int = 0
    @Persisted var totalPairs: Int = 0
    @Persisted var isResolved: Bool = false
    @Persisted var attemptСounter: Int = 0
        
    convenience init(
        id: UUID = .init(),
        level: Int,
        totalPairs: Int,
        isResolved: Bool,
        attemptСounter: Int
    ) {
        self.init()
        self.id = id
        self.level = level
        self.totalPairs = totalPairs
        self.isResolved = isResolved
        self.attemptСounter = attemptСounter
    }
}
