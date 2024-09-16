//
//  Collection + Extenison.swift
//  Bass Memo Champ
//
//  Created by Андрей Сторожко on 09.09.2024.
//

import Foundation

extension Collection {
    var isNotEmpty: Bool {
        return !isEmpty
    }
    
    func withoutNils<T>() -> [T] where Element == Optional<T> {
        return compactMap { $0 }
    }
}
