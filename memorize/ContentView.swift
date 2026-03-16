//
//  ContentView.swift
//  memorize
//
//  Created by Yan on 2026/3/16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "cat")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("早上好")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
