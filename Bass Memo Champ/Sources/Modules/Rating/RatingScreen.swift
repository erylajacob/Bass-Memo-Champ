//
//  RatingScreen.swift
//  Bass Memo Champ
//
//  Created by Андрей Сторожко on 09.09.2024.
//

import SwiftUI

struct RatingScreen: View {
    // MARK: - Setup
    @ObservedObject private var viewModel: RatingViewModel
    @Binding var path: NavigationPath
    @Environment(\.dismiss) var dismiss
    
    init(viewModel: RatingViewModel, path: Binding<NavigationPath>) {
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
                    Text("RATING")
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
                                RatingItemView(viewModel: item, onTap: { _ in
//                                    path.append(MainRouting.game(item))
                                })
                            }
                        }
                        
                        .padding(.horizontal, 24)
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
    RatingScreen(
        viewModel: .init(
            items: [
                .init(id: "1", level: 1, attemptСounter: 1),
                .init(id: "2", level: 2, attemptСounter: 1),
                .init(id: "3", level: 3, attemptСounter: 1),
                .init(id: "4", level: 4, attemptСounter: 0),
                .init(id: "5", level: 5, attemptСounter: 0),
                .init(id: "6", level: 6, attemptСounter: 0),
                .init(id: "7", level: 7, attemptСounter: 0),
                .init(id: "8", level: 8, attemptСounter: 0),
            ]
        ),
        path: .constant(.init()))
}
