//
//  Expenses.swift
//  iExpense
//
//  Created by Christopher Fonseka on 16/03/2022.
//

import Foundation

class Expenses: ObservableObject {

    @Published var items: [ExpenseItem] = load() {
        didSet {
            save(items: items)
        }
    }
}

private extension Expenses {

    private static var key: String { "Expenses" }

    func save(items: [ExpenseItem]) {
        let encoder = JSONEncoder()

        do {
            let data = try encoder.encode(items)
            UserDefaults.standard.set(data, forKey: Expenses.key)
        } catch {
            fatalError(error.localizedDescription)
        }
    }

    static func load() -> [ExpenseItem] {
        guard let data = UserDefaults.standard.data(forKey: Expenses.key) else {
            return []
        }

        let decoder = JSONDecoder()

        do {
            let expenses = try decoder.decode([ExpenseItem].self, from: data)
            return expenses
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}
