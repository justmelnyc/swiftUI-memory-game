//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Cosmos Liu on 2020-06-14.
//  Copyright © 2020 Cosmos Liu. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private var gameModel: MemoryGame<String, EmojiTheme> = createMemoryGame()
    
    private static func createMemoryGame() -> MemoryGame<String, EmojiTheme> {
        let selectedTheme: EmojiTheme = EmojiThemeSet().emojiCollection.randomElement()!
        return MemoryGame<String, EmojiTheme>(numberOfPairsOfCards:
            selectedTheme.numberOfCards, theme: selectedTheme)
        {pairIndex in
            return selectedTheme.emojiSet[pairIndex]
        }
    }
    
    // MARK: - Access to the Model
    var cards: Array<MemoryGame<String, EmojiTheme>.Card> {
        gameModel.cards
    }
    
    var score: Int {
        gameModel.score
    }
    
    var emojiTheme: EmojiTheme {
        gameModel.gameTheme
    }
    
    // MARK: - Intents(s)
    func choose(card: MemoryGame<String, EmojiTheme>.Card) {
        gameModel.choose(card: card)
    }
    
    func restartMemoryGame() {
        gameModel = EmojiMemoryGame.createMemoryGame()
    }
}
