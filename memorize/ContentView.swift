//
//  ContentView.swift
//  memorize
//
//  Created by Yan on 2026/3/16.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        HStack {
            CardView()
            CardView()
            CardView()
            CardView()
    }
        .foregroundStyle(.orange)
        .padding()
    }
}

struct CardView : View {
    var isFaceUp: Bool = true
    var body: some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 20)
                    .strokeBorder(lineWidth: 3)
                Text("👍")
            }
            else {
                RoundedRectangle(cornerRadius: 20)
            }
            
        }
    }
}

#Preview {
    ContentView()
        
}
