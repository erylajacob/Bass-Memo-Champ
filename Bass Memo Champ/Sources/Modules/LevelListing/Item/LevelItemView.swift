//
//  LevelItemView.swift
//  Bass Memo Champ
//
//  Created by Андрей Сторожко on 10.09.2024.
//

import SwiftUI

struct LevelItemView: View {
    // MARK: - Setup
    @ObservedObject private var viewModel: LevelItemViewModel
    var onTap: ((LevelItemViewModel) -> Void)?
    
    init(viewModel: LevelItemViewModel, onTap: ((LevelItemViewModel) -> Void)? = nil) {
        self.viewModel = viewModel
        self.onTap = onTap
    }
    
    var body: some View {
        if viewModel.isResolved {
            Text("LVL \(viewModel.level)")
                .frame(maxWidth: .infinity)
                .textCase(.uppercase)
                .multilineTextAlignment(.center)
                .font(FontPalette.search.font)
                .foregroundStyle(ColorPalette.darkBlueText.color)
                .padding(24)
                .background(
                    RoundedRectangle(cornerRadius: 48)
                        .foregroundStyle(ColorPalette.levelBackgroundColor.color)
                        .shadow(color: ColorPalette.shadowColor.color, radius: 4, x: 0, y: 4)
                )
                .onTapGesture {
                    onTap?(viewModel)
                }
        } else {
            HStack {
                Text("LVL \(viewModel.level)")
                    .frame(maxWidth: .infinity)
                    .textCase(.uppercase)
                    .multilineTextAlignment(.center)
                    .font(FontPalette.search.font)
                    .foregroundStyle(ColorPalette.darkBlueText.color)
                    .padding(.vertical, 24)
                Image("lock")
                    .resizable()
                    .frame(maxWidth: 52, maxHeight: 52)
                    .padding(.horizontal, 12)
            }
            .background(
                RoundedRectangle(cornerRadius: 52)
                    .fill(
                        LinearGradient(
                            gradient: Gradient(
                                colors: [
                                    ColorPalette.levelBackgroundColor.color,
                                    ColorPalette.notResolvedLevelShadowColor.color
                                ]
                            ),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .shadow(color: ColorPalette.shadowColor.color, radius: 4, x: 0, y: 4)
            )
        }
    }
}

#Preview {
    LevelItemView(viewModel: .init(id: "1", level: 1, cardsCount: 4, isResolved: false))
}
