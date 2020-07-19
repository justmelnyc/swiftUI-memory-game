//
//  EmojiTheme.swift
//  Memorize
//
//  Created by Cosmos Liu on 2020-07-19.
//  Copyright © 2020 Cosmos Liu. All rights reserved.
//

import SwiftUI

struct EmojiThemeSet {
    var emojiCollection: Array<EmojiTheme>
    
    init() {
        let halloweenTheme = EmojiTheme(name: "Faces", emojiSet: ["👻", "🎉", "🧸", "🎃"], cardColor: Color.orange)
        let facesTheme: EmojiTheme = EmojiTheme(name: "Faces", emojiSet: ["🥰", "😃", "😥", "🤪", "🤩"], cardColor: Color.red)
        let animalsTheme: EmojiTheme = EmojiTheme(name: "Animals", emojiSet: ["🐶", "🦊", "🐰", "🐵", "🦋"], cardColor: Color.green)
        let sportsTheme: EmojiTheme = EmojiTheme(name: "Sports", emojiSet: ["⚽️", "🏀", "🎱", "🧘‍♀️"], cardColor: Color.gray)
        emojiCollection = [halloweenTheme, facesTheme, animalsTheme, sportsTheme]
    }
    
    mutating func addTheme(theme: EmojiTheme) {
        emojiCollection.append(theme)
    }
}

struct EmojiTheme {
    var name: String
    var emojiSet: Array<String>
    var numberOfCards: Int
    var cardColor: Color

    init(name: String, emojiSet: Array<String>, cardColor: Color) {
        self.name = name
        self.emojiSet = emojiSet
        self.numberOfCards = emojiSet.count
        self.cardColor = cardColor
    }
}
