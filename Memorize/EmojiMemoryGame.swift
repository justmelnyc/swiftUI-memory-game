//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Cosmos Liu on 2020-06-14.
//  Copyright © 2020 Cosmos Liu. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private var gameModel: MemoryGame<String> = createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        let selectedTheme: EmojiTheme = EmojiThemeSet().emojiCollection.randomElement()!
        return MemoryGame<String>(numberOfPairsOfCards:
            selectedTheme.numberOfCards, color: selectedTheme.cardColor)
        {pairIndex in
            return selectedTheme.emojiSet[pairIndex]
        }
    }
    
    // MARK: - Access to the Model
    var cards: Array<MemoryGame<String>.Card> {
        gameModel.cards
    }
    
    // MARK: - Access to the Model Color
    var cardColor: Color {
        gameModel.cardColor
    }
    
    // MARK: - Intents(s)
    func choose(card: MemoryGame<String>.Card) {
        gameModel.choose(card: card)
    }
}
