//
//  ContentView.swift
//  WeSplit
//
//  Created by Christopher Fonseka on 11/02/2022.
//

import SwiftUI

struct ContentView: View {

    let students = ["Harry", "Ron", "Hermione"]
    @State var selected = "Harry"

    var body: some View {
        NavigationView {
            Form {
                Section("Inline") {
                    Picker("Select a Student", selection: $selected) {
                        ForEach(students, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.inline)
                }

                Section("Automatic") {
                    Picker("Select a Student", selection: $selected) {
                        ForEach(students, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.automatic)
                }

                Section("Menu") {
                    Picker("Select a Student", selection: $selected) {
                        ForEach(students, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.menu)
                }

                Section("Segmented") {
                    Picker("Select a Student", selection: $selected) {
                        ForEach(students, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                }

                Section("Wheel") {
                    Picker("Select a Student", selection: $selected) {
                        ForEach(students, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.wheel)
                }
            }
            .navigationTitle("Picker Examples")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
