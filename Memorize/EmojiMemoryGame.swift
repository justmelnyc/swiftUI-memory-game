//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Cosmos Liu on 2020-06-14.
//  Copyright © 2020 Cosmos Liu. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame {
    private var gameModel: MemoryGame<String> = createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis: Array<String> = ["🥰", "😃", "😥", "🤪", "🤩"]
        return MemoryGame<String>(numberOfPairsOfCards:
            Int.random(in: 2...5))
        {pairIndex in
            return emojis[pairIndex]
        }
    }
        
    
    // MARK: - Access to the Model
    var cards: Array<MemoryGame<String>.Card> {
        gameModel.cards
    }
    
    // MARK: - Intents(s)
    func choose(card: MemoryGame<String>.Card) {
        gameModel.choose(card: card)
    }
}
