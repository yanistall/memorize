//
//  ContentView.swift
//  memorize
//
//  Created by yan on 2026/3/16.
//

import SwiftUI

struct ContentView: View {
    var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Theme: \(viewModel.theme.name)")
                        .font(.headline)
                    Text("Score: \(viewModel.score)")
                        .font(.system(size: 34, weight: .bold, design: .rounded))
                        .foregroundStyle(.red)
                }
                Spacer()
                Button {
                    viewModel.newGame()
                } label: {
                    VStack(spacing: 4) {
                        Image(systemName: "sparkles.rectangle.stack")
                            .font(.system(size: 28))
                        Text("New Game")
                            .font(.caption.weight(.semibold))
                    }
                }
            }

            cardList
                .animation(.default, value: viewModel.cards)
            Spacer()
            Button("Shuffle") {
                viewModel.shuffle()
            }
            .font(.title2)
        }
        .padding()
    }
    
    var cardList: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0) {
                ForEach(viewModel.cards) { card in
                    CardView(card: card, themeColor: viewModel.theme.color)
                        .aspectRatio(2/3, contentMode: .fit)
                        .padding(4)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                }
            }
        }
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    var themeColor: Color
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            Group {
                shape.fill(.white)
                shape.strokeBorder(themeColor, lineWidth: 3)
                Text(card.content)
                    .font(Font.system(size: 300))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }
            .opacity(card.isFaceUp ? 1 : 0)
            
            shape.fill(themeColor).opacity(card.isFaceUp ? 0 : 1)
            
        }
        .opacity(card.isMatched && !card.isFaceUp ? 0 : 1)
    }
}



#Preview {
    ContentView(viewModel: EmojiMemoryGame())
    
}
