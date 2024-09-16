//
//  LevelCompleteScreen.swift
//  Bass Memo Champ
//
//  Created by Андрей Сторожко on 09.09.2024.
//

import SwiftUI

struct LevelCompleteScreen: View {
    @State private var isVisible = false
    @ObservedObject private var viewModel: LevelCompleteViewModel
    @Binding var path: NavigationPath
    @Environment(\.dismiss) var dismiss
    var onTap: () -> Void
    
    init(viewModel: LevelCompleteViewModel, path: Binding<NavigationPath>, onTap: @escaping () -> Void) {
        self.viewModel = viewModel
        self._path = path
        self.onTap = onTap
    }
    
    var body: some View {
        VStack {
            Spacer()
            Text("YOU WIN!")
                .font(.system(size: 70, weight: .bold, design: .rounded))
                .foregroundStyle(
                    LinearGradient(
                        colors: [Color.orange, Color.red],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .shadow(color: .black, radius: 5, x: 0, y: 5)
                .shadow(color: .black, radius: 1)
            Spacer()
            if isVisible {
                Text("You completed this level in \(viewModel.attemptCounter) moves.")
                    .textCase(.uppercase)
                    .multilineTextAlignment(.center)
                    .font(FontPalette.search.font)
                    .foregroundStyle(ColorPalette.darkBlueText.color)
                    .padding(12)
                    .background(
                        RoundedRectangle(cornerRadius: 52)
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(
                                        colors: [
                                            ColorPalette.logOutButtonBackground.color,
                                            ColorPalette.logOutButtonShadowColor.color
                                        ]
                                    ),
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            )
                    )
                    .padding(.horizontal, 24)
                    .scaleEffect(isVisible ? 1.0 : 0.1)
                    .opacity(isVisible ? 1 : 0)
            }
            Spacer()
            MainButton(text: "OK", fontPalette: .sign, layout: .logOut, style: .main, cornerRadius: 52, action: onTap)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Image("onboardingBackground")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .scaledToFill()
        )
        .onAppear {
            withAnimation(.easeOut(duration: 1.5)) {
                isVisible = true
            }
        }
    }
}

#Preview {
    LevelCompleteScreen(viewModel: .init(attemptCounter: 1), path: .constant(.init()), onTap: {})
}
