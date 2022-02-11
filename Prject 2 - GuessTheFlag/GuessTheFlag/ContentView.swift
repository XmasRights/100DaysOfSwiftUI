//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Christopher Fonseka on 11/02/2022.
//

import SwiftUI

struct ContentView: View {

    @State private var showingAlert = false

    var body: some View {
        Button("Show Alert") {
            showingAlert = true
        }
        .alert("Important Message", isPresented: $showingAlert) {
            Button("Nah") {}
            Button("Nah Yeah", role: .cancel) {}
            Button("Yeah Nah", role: .destructive) {}
            Button("Yeah") {}
        } message: {
            Text("Please read this")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
