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
                Text("Score: \(viewModel.score)").foregroundColor(viewModel.emojiTheme.cardColor)
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
    
    private func body(for size: CGSize) -> some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth )
                Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(45), clockwise: true).padding(5).opacity(0.4)
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
    
    private let cornerRadius: CGFloat = 10.0
    private let edgeLineWidth: CGFloat = 3
    private func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.7
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(card: game.cards[2])
        return EmojiMemoryGameView(viewModel: game)
    }
}
