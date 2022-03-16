//
//  AddView.swift
//  iExpense
//
//  Created by Christopher Fonseka on 16/03/2022.
//

import SwiftUI

struct AddView: View {

    @Environment(\.dismiss) var dismiss

    @ObservedObject var expenses: Expenses

    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    @State private var currency = Currency.poundSterling

    let types = ["Business", "Personal"]

    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)

                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }

                TextField(
                    "Amount",
                    value: $amount,
                    format: .number
                )

                Picker("Currency", selection: $currency) {
                    ForEach(Currency.allCases, id: \.rawValue) {
                        Text($0.symbol).tag($0)
                    }
                }
                .pickerStyle(.segmented)
            }
            .navigationTitle("Add new expense")
            .toolbar {
                Button("Save") {
                    let item = ExpenseItem(
                        name: name,
                        type: type,
                        amount: amount,
                        currency: currency
                    )
                    expenses.items.append(item)

                    dismiss()
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
