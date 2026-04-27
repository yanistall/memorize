//
//  ThemePool.swift
//  memorize
//
//  Created by Codex on 2026/4/27.
//

import SwiftUI

struct ThemePool<Item> {
    private(set) var themes: [Theme] = []

    mutating func addTheme(_ theme: Theme) {
        themes.append(theme)
    }

    struct Theme {
        let name: String
        let color: Color
        let numberOfPairs: Int
        let items: [Item]
    }
}
