//
//  OnboardingScreen.swift
//  Bass Memo Champ
//
//  Created by Андрей Сторожко on 09.09.2024.
//

import SwiftUI

enum MainRouting: Hashable {
    case root
    case levelListing
    case game(LevelItemViewModel)
    case rating
    case account
    case complete
    case registation
    case main
}

struct OnboardingScreen: View {
    // MARK: - Setup
    @ObservedObject private var viewModel: OnboardingViewModel
    @State private var path: NavigationPath = .init()
    
    init(viewModel: OnboardingViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                MainScrollView(text: "WELCOME TO BASS MEMO CHAMP – DIVE INTO THE ULTIMATE FISHING ADVENTURE! GET READY TO TEST YOUR MEMORY WHILE EXPLORING THE BEAUTY OF THE OCEAN! YOUR TASK IS SIMPLE: MATCH PAIRS OF SEA CREATURES. CAST YOUR NET OF CONCENTRATION AND SEE IF YOU CAN UNCOVER ALL THE MATCHING PAIRS BEFORE THE TIDE ROLLS IN. \nHOW TO PLAY: \n•TAP ANY TWO CARDS TO REVEAL WHAT’S UNDERNEATH. \n•FIND MATCHING PAIRS TO CLEAR THEM FROM THE BOARD. \n•THE FEWER MOVES YOU MAKE, THE HIGHER YOUR SCORE! \nARE YOU READY TO REEL IN SOME FUN? LET’S START FISHING FOR PAIRS! 🎣🐠")
                    .padding(.top, 52)
                    .padding(.horizontal, 24)
                MainButton(text: "START", fontPalette: .hThree, layout: .regular, style: .main, cornerRadius: 52) {
                    path.append(MainRouting.root)
                }
                .padding(.top, 52)
                .padding(.bottom, 24)
            }
            .navigationDestination(for: MainRouting.self) { router in
                switch router {
                case .root:
                    RootScreen(path: $path)
                        .navigationBarBackButtonHidden(true)
                case .levelListing:
                    LevelListingScreen(viewModel: .init(items: viewModel.reloadData()), path: $path)
                        .navigationBarBackButtonHidden(true)
                case .game(let item):
                    GameScreen(viewModel: .init(id: item.id, cards: [], totalPairs: item.cardsCount, level: item.level), path: $path)
                        .navigationBarBackButtonHidden(true)
                case .account:
                    AccountScreen(viewModel: .init())
                        .navigationBarBackButtonHidden(true)
                case .rating:
                    RatingScreen(viewModel: .init(items: []), path: $path)
                        .navigationBarBackButtonHidden(true)
                case .complete:
                    LevelCompleteScreen(viewModel: .init(attemptCounter: 0), path: $path, onTap: {})
                        .navigationBarBackButtonHidden(true)
                case .registation:
                    RegistrationScreen(viewModel: .init(path: $path))
                        .navigationBarBackButtonHidden(true)
                case .main:
                    MainScreen(viewModel: .init(), path: $path)
                        .navigationBarBackButtonHidden(true)
                }
            }
            .background {
                Image("onboardingBackground")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .scaledToFill()
            }
            .onAppear {
                viewModel.loadData()
            }
        }
    }
}

#Preview {
    OnboardingScreen(viewModel: .init())
}
