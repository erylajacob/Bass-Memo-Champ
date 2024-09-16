//
//  CardView.swift
//  Bass Memo Champ
//
//  Created by Андрей Сторожко on 11.09.2024.
//

import SwiftUI

struct CardView: View {
    let viewModel: CardViewModel

    var onTap: ((CardViewModel) -> Void)?
    
    init(viewModel: CardViewModel, onTap: ((CardViewModel) -> Void)? = nil) {
        self.viewModel = viewModel
        self.onTap = onTap
    }
    var body: some View {
        ZStack {
            if viewModel.isFaceUp || viewModel.isMatched {
                Image(viewModel.image)
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .padding(16)
            } else {
                Image("card") // Assuming this is the image for the card back
                    .resizable()
                    .scaledToFill()
            }
        }
        .aspectRatio(2/3, contentMode: .fit)
        .rotation3DEffect(
            Angle(degrees: viewModel.isFaceUp ? 0 : 180),
            axis: (x: 0, y: 1, z: 0)
        )
        .opacity(viewModel.isMatched ? 0 : 1) // Cards disappear if matched
        .scaleEffect(viewModel.isMatched ? 0.5 : 1) // Cards shrink on match
        .animation(.easeInOut(duration: 0.5), value: viewModel.isFaceUp) // Flip animation
        .animation(.easeInOut(duration: 0.5), value: viewModel.isMatched) // Disappear animation
        .onTapGesture(perform: {
            onTap?(viewModel)
        })
    }
}


#Preview {
    CardView(viewModel: .init(image: "1", isMatched: false, isFaceUp: false))
}
