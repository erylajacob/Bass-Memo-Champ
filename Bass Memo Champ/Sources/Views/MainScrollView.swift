//
//  MainScrollView.swift
//  Bass Memo Champ
//
//  Created by Андрей Сторожко on 10.09.2024.
//

import SwiftUI

struct MainScrollView: View {
    private var text: String
    
    init(text: String) {
        self.text = text
    }
    
    var body: some View {
            ScrollView {
                Text(text)
                .textCase(.uppercase)
                .multilineTextAlignment(.center)
                .font(FontPalette.search.font)
                .padding(12)
                
            }
            .scrollIndicators(.hidden)
            .background(Color.white.opacity(0.7))
            .frame(maxWidth: .infinity)
            .cornerRadius(12)
    }
}

#Preview {
    MainScrollView(text: "123321123321123321123321123321123321123321123321123321123321123321123321")
}
