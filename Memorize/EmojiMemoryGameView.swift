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
        HStack {
            ForEach(viewModel.cards) { card in
                CardView(card: card).onTapGesture{
                    self.viewModel.choose(card: card)
                }
            }
        }
        .padding()
        .aspectRatio(0.67, contentMode: .fit)
        .foregroundColor(Color.orange)
        .font(viewModel.cards.count<10 ? .largeTitle : .title)
    }
}

struct CardView: View{
    var card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3 )
                Text(card.content)
            } else{
                RoundedRectangle(cornerRadius: 10.0).fill()
            }
                       
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}