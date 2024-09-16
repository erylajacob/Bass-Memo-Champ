//
//  LevelListingScreen.swift
//  Bass Memo Champ
//
//  Created by Андрей Сторожко on 09.09.2024.
//

import SwiftUI

struct LevelListingScreen: View {
    // MARK: - Setup
    @ObservedObject private var viewModel: LevelListingViewModel
    @Binding var path: NavigationPath
    @Environment(\.dismiss) var dismiss
    
    init(viewModel: LevelListingViewModel, path: Binding<NavigationPath>) {
        self.viewModel = viewModel
        self._path = path
    }
    
    var body: some View {
            VStack {
                Button(action: {
                    dismiss()
                }, label: {
                    Image("backButton")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 30, height: 30, alignment: .bottom)
                        .padding(.top, 12)
                        .padding(.horizontal, 24)
                })
                .frame(maxWidth: .infinity, alignment: .leading)
                VStack(alignment: .center) {
                    Text("LEVEL")
                        .font(.system(size: UIScreen.main.bounds.width * 0.1, weight: .heavy))
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(
                            LinearGradient( // Градиент для текста
                                colors: [Color.orange, Color.red],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .shadow(color: .black, radius: 5, x: 0, y: 5)
                        .shadow(color: .black, radius: 1)
                        .padding(.top, 24)
                    ScrollView(.vertical) {
                        LazyVStack {
                            ForEach(viewModel.items, id: \.self) { item in
                                LevelItemView(viewModel: item, onTap: { _ in
                                    path.append(MainRouting.game(item))
                                })
                            }
                        }
                        
                        .padding(.horizontal, 48)
                    }
                    .scrollIndicators(.hidden)
                }
                .background(Color.white.opacity(0.7))
                .frame(maxWidth: .infinity)
                .cornerRadius(32)
                .padding(.horizontal, 48)
                .padding(.bottom, 48)
        }
//            .edgesIgnoringSafeArea(.all)
            .background(
                Image("scrollBackground")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .scaledToFill()
            )
            .onAppear {
                viewModel.reloadData()
            }
    }
}

#Preview {
    LevelListingScreen(
        viewModel: .init(
            items: [
                .init(id: "1", level: 1, cardsCount: 4, isResolved: true),
                .init(id: "2", level: 2, cardsCount: 4, isResolved: false),
                .init(id: "3", level: 3, cardsCount: 4, isResolved: false),
                .init(id: "4", level: 4, cardsCount: 4, isResolved: false),
                .init(id: "5", level: 5, cardsCount: 4, isResolved: false),
                .init(id: "6", level: 6, cardsCount: 4, isResolved: false),
                .init(id: "7", level: 7, cardsCount: 4, isResolved: false),
                .init(id: "8", level: 8, cardsCount: 4, isResolved: false),
            ]
        ),
        path: .constant(.init()))
}
