//
//  MemoryGame.swift
//  Memorize
//
//  Created by Cosmos Liu on 2020-06-14.
//  Copyright © 2020 Cosmos Liu. All rights reserved.
//

import SwiftUI

struct MemoryGame<CardContent, GameTheme> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    private(set) var gameTheme: GameTheme
    private(set) var score: Int
    private var seenCardContent: Array<CardContent>
    
    private var indexOfTheOneAndTheOnlyFaceUpCard: Int? {
        get {
            cards.indices.filter { index in cards[index].isFaceUp }.only
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = index == newValue
            }
        }
    }
    
    mutating func choose(card: Card) {
        print("Card chosen: \(card)")
        print(seenCardContent)
        if let chosenIndex: Int = cards.firstIndex(matching: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched{
            if let potentialMatchIndex = indexOfTheOneAndTheOnlyFaceUpCard {
                let currContent = cards[chosenIndex].content
                let prevContent = cards[potentialMatchIndex].content
                if currContent == prevContent {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    score += 2
                }
                else { // mismatch
                    checkScorePenalty(cardContent: currContent)
                    checkScorePenalty(cardContent: prevContent)
                }
                self.cards[chosenIndex].isFaceUp = true
            } else {
                indexOfTheOneAndTheOnlyFaceUpCard = chosenIndex
            }
        }
    }
    
    mutating func checkScorePenalty(cardContent: CardContent) {
        if seenCardContent.contains(cardContent) {
            score -= 1
        } else {
            seenCardContent.append(cardContent)
        }
    }
    
    init(numberOfPairsOfCards: Int, theme: GameTheme, cardContentFactory: (Int) -> CardContent){
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
        cards.shuffle()
        gameTheme = theme
        score = 0
        seenCardContent = Array<CardContent>()
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
