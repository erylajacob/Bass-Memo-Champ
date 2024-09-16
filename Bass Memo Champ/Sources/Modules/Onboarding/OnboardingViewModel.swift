//
//  OnboardingViewModel.swift
//  Bass Memo Champ
//
//  Created by Андрей Сторожко on 12.09.2024.
//

import Foundation

final class OnboardingViewModel: ObservableObject {
    let gameStorage: GameDomainModelStorage = .init()
}

extension OnboardingViewModel {
    func reloadData() -> [LevelItemViewModel] {
        gameStorage.read().compactMap({ makeCellViewModel(for: $0) })
    }
    
    func makeCellViewModel(
        for model: GameDomainModel
    ) -> LevelItemViewModel? {
        return .init(id: model.id.uuidString, level: model.level, cardsCount: model.totalPairs, isResolved: model.isResolved)
    }
    
    func loadData() {
        let gameStorage: GameDomainModelStorage = .init()
        
        guard gameStorage.read().isEmpty else { return }
        
        gameStorage.store(item: .init(level: 1, totalPairs: 2, isResolved: true, attemptСounter: 0))
        gameStorage.store(item: .init(level: 2, totalPairs: 3, isResolved: false, attemptСounter: 0))
        gameStorage.store(item: .init(level: 3, totalPairs: 3, isResolved: false, attemptСounter: 0))
        gameStorage.store(item: .init(level: 4, totalPairs: 4, isResolved: false, attemptСounter: 0))
        gameStorage.store(item: .init(level: 5, totalPairs: 4, isResolved: false, attemptСounter: 0))
        gameStorage.store(item: .init(level: 6, totalPairs: 4, isResolved: false, attemptСounter: 0))
        gameStorage.store(item: .init(level: 7, totalPairs: 6, isResolved: false, attemptСounter: 0))
        gameStorage.store(item: .init(level: 8, totalPairs: 6, isResolved: false, attemptСounter: 0))
        gameStorage.store(item: .init(level: 9, totalPairs: 6, isResolved: false, attemptСounter: 0))
        gameStorage.store(item: .init(level: 10, totalPairs: 8, isResolved: false, attemptСounter: 0))
        gameStorage.store(item: .init(level: 11, totalPairs: 8, isResolved: false, attemptСounter: 0))
        gameStorage.store(item: .init(level: 12, totalPairs: 8, isResolved: false, attemptСounter: 0))
        gameStorage.store(item: .init(level: 13, totalPairs: 8, isResolved: false, attemptСounter: 0))
        gameStorage.store(item: .init(level: 14, totalPairs: 10, isResolved: false, attemptСounter: 0))
        gameStorage.store(item: .init(level: 15, totalPairs: 10, isResolved: false, attemptСounter: 0))
        gameStorage.store(item: .init(level: 16, totalPairs: 10, isResolved: false, attemptСounter: 0))
        gameStorage.store(item: .init(level: 17, totalPairs: 10, isResolved: false, attemptСounter: 0))
    }
}
