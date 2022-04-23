//
//  ContentView.swift
//  Moonshot
//
//  Created by Christopher Fonseka on 23/04/2022.
//

import SwiftUI

struct ContentView: View {

    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")

    let cols = [
        GridItem(.adaptive(minimum: 150))
    ]

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: cols) {
                    ForEach(missions) { mission in
                        NavigationLink {
                            Text("DetaiLView")
                        } label: {
                            VStack {
                                Image(mission.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)

                                VStack {
                                    Text(mission.displayName)
                                        .font(.headline)

                                    Text(mission.formattedLaunchDate)
                                        .font(.caption)
                                }
                                .frame(maxWidth: .infinity)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Moonshot")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
