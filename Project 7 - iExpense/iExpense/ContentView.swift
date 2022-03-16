//
//  ContentView.swift
//  iExpense
//
//  Created by Christopher Fonseka on 16/03/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()

    @State private var showingAddExpense = false

    func cell(item: ExpenseItem) -> some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.name)

                Text(item.type)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }

            Spacer()

            Text(
                item.amount,
                format: .currency(code: item.currency.rawValue)
            )
                .intensityColour(value: item.amount)
        }
    }

    var body: some View {
        NavigationView {
            List {
                Section("Personal") {
                    ForEach(expenses.items) { item in
                        if item.type == "Personal" {
                            cell(item: item)
                        }
                    }
                    .onDelete(perform: remove)
                }

                Section("Business") {
                    ForEach(expenses.items) { item in
                        if item.type == "Business" {
                            cell(item: item)
                        }
                    }
                    .onDelete(perform: remove)
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    self.showingAddExpense.toggle()
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }

    func remove(items offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

private extension View {

    func intensityColour(value: Double) -> some View {
        self.foregroundColor(value >= 100 ? .red
                             : value >= 10 ? .yellow
                             : .green)
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
