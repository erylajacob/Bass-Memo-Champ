//
//  RatingViewModel.swift
//  Bass Memo Champ
//
//  Created by Андрей Сторожко on 09.09.2024.
//

import Foundation

final class RatingViewModel: ObservableObject {
    @Published var items: [RatingItemViewModel]
    
    init(items: [RatingItemViewModel]) {
        self.items = items
    }
    
    func reloadData() {
        let gameStorage: GameDomainModelStorage = .init()
        let newItems = gameStorage.read().compactMap({ makeCellViewModel(for: $0) })
        items = newItems
    }
    
    func makeCellViewModel(
        for model: GameDomainModel
    ) -> RatingItemViewModel? {
        
        return .init(id: model.id.uuidString, level: model.level, attemptСounter: model.attemptСounter)
    }
}
