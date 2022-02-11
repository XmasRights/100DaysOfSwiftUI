//
//  ContentView.swift
//  WeSplit
//
//  Created by Christopher Fonseka on 11/02/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var peoplePickerSelection = 2
    @State private var tipPercentage = 20

    let tipPercentages = [10, 15, 20, 25, 0]

    var numberOfPeople: Double {
        Double(peoplePickerSelection) + 2.0
    }

    var selectedTip: Double {
        Double(tipPercentage)
    }

    var totalPerPerson: Double {
        let tipValue = checkAmount / 100 * selectedTip
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / numberOfPeople

        return amountPerPerson
    }

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField(
                        "Amount",
                        value: $checkAmount,
                        format: .currency(
                            code: Locale.current.currencyCode ?? "GBP"
                        )
                    )
                        .keyboardType(.decimalPad)

                    Picker("Number of People", selection: $peoplePickerSelection) {
                        ForEach(2..<100) {
                            Text("\($0) People")
                        }
                    }
                }

                Section {
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("What tip would you like to leave?")
                }

                Section {
                    Text(
                        totalPerPerson,
                        format: .currency(
                            code: Locale.current.currencyCode ?? "GBP"
                        )
                    )
                } header: {
                    Text("You Pay")
                }
            }
            .navigationTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
