//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Christopher Fonseka on 11/02/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("Button 1") {}
            .buttonStyle(.bordered)

            Button("Button 2", role: .destructive) {}
            .buttonStyle(.bordered)

            Button("Button 3") {}
            .buttonStyle(.borderedProminent)

            Button("Button 4", role: .destructive) {}
            .buttonStyle(.borderedProminent)

            Button("Button 5") {}
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
