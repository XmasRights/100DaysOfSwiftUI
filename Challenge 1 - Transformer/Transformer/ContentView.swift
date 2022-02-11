//
//  ContentView.swift
//  Transformer
//
//  Created by Christopher Fonseka on 11/02/2022.
//

import SwiftUI

enum TemperatureUnits: String, CaseIterable, Identifiable {
    case Celcius
    case Farenheit
    case Kelvin

    var id: String { self.rawValue }
}

struct ContentView: View {

    @State private var inputValue = 0.0
    @FocusState private var inputIsFocused: Bool

    @State var selectedTemp = TemperatureUnits.Celcius.rawValue

    var body: some View {

        NavigationView {
            Form {
                Section {
                    TextField("", value: $inputValue, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($inputIsFocused)

                    Picker("", selection: $selectedTemp) {
                        ForEach(TemperatureUnits.allCases) {
                            Text($0.rawValue)
                        }
                    }
                    .pickerStyle(.segmented)

                } header: {
                    Text("Pick a Temperature")
                }

                Section {

                    HStack {
                        Text("Celcius")
                            .foregroundStyle(.secondary)
                        Spacer()
                        Text("\(celciusValue, format: .number) °C")
                    }

                    HStack {
                        Text("Farenheit")
                            .foregroundStyle(.secondary)
                        Spacer()
                        Text("\(fahrenheitValue, format: .number) °F")
                    }

                    HStack {
                        Text("Kelvin")
                            .foregroundStyle(.secondary)
                        Spacer()
                        Text("\(kelvinValue, format: .number) °K")
                    }
                }
            }
            .navigationTitle("Transformer")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()

                    Button("Done") {
                        inputIsFocused = false
                    }
                }
            }
        }
    }
}

private extension ContentView {

    var selectedUnits: TemperatureUnits {
        .init(rawValue: self.selectedTemp)!
    }

    var celciusValue: Double {
        switch selectedUnits {
            case .Celcius:
                return inputValue
            case .Farenheit:
                return (inputValue - 32) / 1.8
            case .Kelvin:
                return inputValue - 273.15
        }
    }

    var fahrenheitValue: Double {
        switch selectedUnits {
            case .Celcius:
                return inputValue * 1.8 + 32
            case .Farenheit:
                return inputValue
            case .Kelvin:
                return (inputValue - 273.15) * 1.8 + 32.00
        }
    }

    var kelvinValue: Double {
        switch selectedUnits {
            case .Celcius:
                return inputValue + 273.15
            case .Farenheit:
                return 273.15 + (inputValue - 32) / 1.8
            case .Kelvin:
                return inputValue
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
