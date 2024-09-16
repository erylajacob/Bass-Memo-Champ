//
//  MainScreen.swift
//  Bass Memo Champ
//
//  Created by Андрей Сторожко on 09.09.2024.
//

import SwiftUI

struct MainScreen: View {
    @ObservedObject private var viewModel: MainViewModel
    @Binding var path: NavigationPath

    init(viewModel: MainViewModel, path: Binding<NavigationPath>) {
        self.viewModel = viewModel
        self._path = path
    }
    
    var body: some View {
        VStack(spacing: 24) {
            Image("banner")
                .resizable()
                .scaledToFit()
                .padding(.top, 48)
            Spacer()
            MainButton(text: "SELECT LEVEL", fullWidth: true, fontPalette: .hTwo, layout: .main, style: .selectLevel, cornerRadius: 32) {
                path.append(MainRouting.levelListing)
            }
            .background(
                RoundedRectangle(cornerRadius: 52)
                .shadow(color: ColorPalette.shadowColor.color, radius: 4, x: 0, y: 4)
            )
            MainButton(text: "RATING", fullWidth: true, fontPalette: .hThree, layout: .logOut, style: .main, cornerRadius: 32) {
                path.append(MainRouting.rating)
            }
            .background(
                RoundedRectangle(cornerRadius: 48)
                .shadow(color: ColorPalette.shadowColor.color, radius: 4, x: 0, y: 4)
            )
            .padding(.horizontal, 24)
            MainButton(text: "ACCOUNT", fullWidth: true, fontPalette: .hThree, layout: .logOut, style: .additional, cornerRadius: 32) {
                path.append(MainRouting.account)
            }
            .background(
                RoundedRectangle(cornerRadius: 48)
                .shadow(color: ColorPalette.shadowColor.color, radius: 4, x: 0, y: 4)
            )
            .padding(.horizontal, 32)
            Spacer()
        }
        .padding(.horizontal, 24)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Image("mainScreenBackground")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .scaledToFill()
        )
    }
}

#Preview {
    MainScreen(viewModel: .init(), path: .constant(.init()))
}
