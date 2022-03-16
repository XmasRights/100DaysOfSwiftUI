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

    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)

                            Text(item.type)
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }

                        Spacer()
                        Text(item.amount, format: .currency(code: "USD"))
                            .foregroundColor(.secondary)
                    }

                }
                .onDelete(perform: remove)
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
