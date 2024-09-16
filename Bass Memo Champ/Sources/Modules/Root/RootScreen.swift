//
//  RootScreen.swift
//  Bass Memo Champ
//
//  Created by Андрей Сторожко on 10.09.2024.
//

import SwiftUI

struct RootScreen: View {
    @Binding private var path: NavigationPath
    @StateObject var sessionManager: SessionManager = .shared
    
    init(path: Binding<NavigationPath>) {
        self._path = path
    }
    
    var body: some View {
        if sessionManager.isLoggedIn {
            MainScreen(viewModel: .init(), path: $path)
        } else {
            AuthorizationScreen(viewModel: .init(), path: $path)
        }
    }
}

#Preview {
    RootScreen(path: .init(projectedValue: .constant(.init())))
}
