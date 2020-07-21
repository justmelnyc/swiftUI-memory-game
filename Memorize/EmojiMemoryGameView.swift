//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Cosmos Liu on 2020-06-13.
//  Copyright © 2020 Cosmos Liu. All rights reserved.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    var body: some View {
        VStack {
            HStack(spacing: 20) {
                Text("Score: 8").foregroundColor(viewModel.emojiTheme.cardColor)
                Text(viewModel.emojiTheme.name).font(Font.title)
                Button("New Game", action: {
                    self.viewModel.restartMemoryGame()
                })
            }
            .frame(maxWidth: .infinity)
            Grid(viewModel.cards) { card in
                    CardView(card: card).onTapGesture{
                        self.viewModel.choose(card: card)
                    }
            .padding(5)
            }
            .padding(.bottom).padding(.leading).padding(.trailing)
            .foregroundColor(viewModel.emojiTheme.cardColor)
        }
    }
}

struct CardView: View{
    var card: MemoryGame<String, EmojiTheme>.Card
    
    var body: some View {
        GeometryReader(content: { geometry in
            self.body(for: geometry.size)
        })
    }
    
    func body(for size: CGSize) -> some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth )
                Text(card.content)
            } else{
                if !card.isMatched {
                    RoundedRectangle(cornerRadius: cornerRadius).fill()
                }
            }
        }
        .font(Font.system(size: fontSize(for: size)))
    }
    
    // MARK: - Drawing Constants
    
    let cornerRadius: CGFloat = 10.0
    let edgeLineWidth: CGFloat = 3
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.75
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
