//
//  RatingItemView.swift
//  Bass Memo Champ
//
//  Created by Андрей Сторожко on 10.09.2024.
//

import SwiftUI

struct RatingItemView: View {
    // MARK: - Setup
    @ObservedObject private var viewModel: RatingItemViewModel
    var onTap: ((RatingItemViewModel) -> Void)?
    
    init(viewModel: RatingItemViewModel, onTap: ((RatingItemViewModel) -> Void)? = nil) {
        self.viewModel = viewModel
        self.onTap = onTap
    }
    
    var body: some View {
        HStack {
            Text("LVL \(viewModel.level)")
                .textCase(.uppercase)
                .multilineTextAlignment(.center)
                .font(FontPalette.search.font)
                .foregroundStyle(ColorPalette.darkBlueText.color)
                .padding(.horizontal, 12)
            Spacer()
            Text("\(viewModel.attemptСounter)")
                .textCase(.uppercase)
                .multilineTextAlignment(.center)
                .font(FontPalette.search.font)
                .shadow(color: .black, radius: 1)
                .foregroundStyle(.white)
                .padding(.horizontal, 12)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 24)
        .background(
            RoundedRectangle(cornerRadius: 24)
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
        .onTapGesture {
            onTap?(viewModel)
        }
    }
}

#Preview {
    RatingItemView(viewModel: .init(id: "1", level: 1, attemptСounter: 0))
}
