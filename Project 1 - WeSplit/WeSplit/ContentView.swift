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

    @FocusState private var amountIsFocused: Bool

    let tipPercentages = [10, 15, 20, 25, 0]

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField(
                        "Amount",
                        value: $checkAmount,
                        format: currenyFormat
                    )
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)

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
                        grandTotal,
                        format: currenyFormat
                    )
                } header: {
                    Text("Total to Pay")
                }

                Section {
                    Text(
                        totalPerPerson,
                        format: .currency(
                            code: Locale.current.currencyCode ?? "GBP"
                        )
                    )
                } header: {
                    Text("Amount Per Person")
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()

                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

// MARK: - Maths Helpers

private extension ContentView {

    var numberOfPeople: Double {
        Double(peoplePickerSelection) + 2.0
    }

    var selectedTip: Double {
        Double(tipPercentage)
    }

    var grandTotal: Double {
        let tipValue = checkAmount / 100 * selectedTip
        return checkAmount + tipValue
    }

    var totalPerPerson: Double {
        return grandTotal / numberOfPeople
    }
}

// MARK: - Formatting Helpers

private extension ContentView {
    var currenyFormat: FloatingPointFormatStyle<Double>.Currency {
        let code = Locale.current.currencyCode ?? "GBP"
        return .init(code: code)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
