//
//  EmojiMemoryGame.swift
//  memorize
//
//  Created by yan on 2026/3/30.
//

import Foundation
import SwiftUI

@Observable
class EmojiMemoryGame {

    typealias EmojiThemePool = ThemePool<String>

    private static func createThemePool() -> EmojiThemePool {
        var pool = EmojiThemePool()
        pool.addTheme(
            EmojiThemePool.Theme(
                name: "交通",
                color: .orange,
                numberOfPairs: 8,
                items: ["汽車", "計程", "公車", "警車", "救護", "消防", "火車", "輪船", "單車", "機車", "飛機", "捷運"]
            )
        )
        pool.addTheme(
            EmojiThemePool.Theme(
                name: "動物",
                color: .green,
                numberOfPairs: 8,
                items: ["小狗", "小貓", "老鼠", "兔子", "熊貓", "老虎", "獅子", "猴子", "牛", "羊", "鹿", "青蛙"]
            )
        )
        pool.addTheme(
            EmojiThemePool.Theme(
                name: "食物",
                color: .red,
                numberOfPairs: 8,
                items: ["蘋果", "香蕉", "草莓", "葡萄", "西瓜", "橘子", "漢堡", "披薩", "薯條", "蛋糕", "壽司", "拉麵"]
            )
        )
        return pool
    }

    private static func randomTheme(from pool: EmojiThemePool) -> EmojiThemePool.Theme {
        pool.themes.randomElement() ?? EmojiThemePool.Theme(
            name: "預設",
            color: .blue,
            numberOfPairs: 6,
            items: ["😀", "😄", "😆", "😎", "🥳", "🤖", "👻", "🦄"]
        )
    }

    private static func createMemoryGame(with theme: EmojiThemePool.Theme) -> MemoryGame<String> {
        let shuffledItems = theme.items.shuffled()
        let pairCount = min(theme.numberOfPairs, shuffledItems.count)
        return MemoryGame<String>(numberOfPairsOfCards: pairCount) { index in
            shuffledItems[index]
        }
    }

    private(set) var themePool: EmojiThemePool
    private(set) var theme: EmojiThemePool.Theme
    private var model: MemoryGame<String>

    init() {
        let pool = EmojiMemoryGame.createThemePool()
        let selectedTheme = EmojiMemoryGame.randomTheme(from: pool)
        let game = EmojiMemoryGame.createMemoryGame(with: selectedTheme)

        themePool = pool
        theme = selectedTheme
        model = game
    }

    var cards: [MemoryGame<String>.Card] {
        model.cards
    }

    var score: Int {
        model.score
    }
    
    // MARK: - intent
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    func shuffle() {
        model.shuffle()
    }

    func newGame() {
        theme = EmojiMemoryGame.randomTheme(from: themePool)
        model = EmojiMemoryGame.createMemoryGame(with: theme)
    }
}
