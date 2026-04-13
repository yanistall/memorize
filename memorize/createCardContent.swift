//
//  createCardContent.swift
//  memorize
//
//  Created by Yan on 2026/4/13.
//

import Foundation

func createCardContent(index: Int) -> String {
    return "A"
}

class EmojiMemoryGame {
    static var emojis = ["A", "B", "C","D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards:4,
        createCardContent: {index in EmojiMemoryGame.emojis[index]})
    }
    
    private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: [MemoryGame<String>.Card] {
        model.cards
    }

}
