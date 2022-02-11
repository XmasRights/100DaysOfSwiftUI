//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Christopher Fonseka on 11/02/2022.
//

import SwiftUI

struct ContentView: View {

    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var scoreMessage = ""

    @State var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()

    @State var correctAnswer = Int.random(in: 0...2)

    @State var currentScore = 0

    @State var questionCount = 0

    var body: some View {
        ZStack {
            RadialGradient(
                stops: [
                    .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                    .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
                ],
                center: .top,
                startRadius: 200,
                endRadius: 700
            )
                .ignoresSafeArea()

            VStack {

                Spacer()

                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)

                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))

                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }

                    ForEach(0..<3) { index in
                        Button {
                            flagTapped(index)

                        } label: {
                            Image(countries[index])
                                .renderingMode(.original)
                                .clipShape(Capsule())
                                .shadow(radius: 5)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))

                Spacer()
                Spacer()

                Text("Score: \(currentScore)")
                    .foregroundColor(.white)
                    .font(.title.bold())

                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            if shouldEndGame {
                Button( "New Game", action: restartGame)
            } else {
                Button( "Continue", action: askQuestion)
            }
        } message: {
            Text(scoreMessage)
        }
    }

    func flagTapped(_ index: Int) {
        if index == correctAnswer {
            scoreTitle = "Correct"
            currentScore += 1
        } else {
            scoreTitle = "Wrong this is the flag of \(countries[index])"
        }

        questionCount += 1
        scoreMessage = "Your score value is \(currentScore)"

        if shouldEndGame {
            scoreTitle = "Game Over"
            scoreMessage = "Well done, your final score is \(currentScore)"
        }

        showingScore = true
    }

    var shouldEndGame: Bool {
        questionCount >= 7
    }

    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }

    func restartGame() {
        askQuestion()
        questionCount = 0
        currentScore = 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
