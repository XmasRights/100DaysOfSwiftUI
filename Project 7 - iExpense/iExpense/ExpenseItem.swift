//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Christopher Fonseka on 16/03/2022.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    let id: UUID
    let name: String
    let type: String
    let amount: Double
    let currency: Currency
}

extension ExpenseItem {

    init(name: String, type: String, amount: Double, currency: Currency) {
        self.id = UUID()
        self.name = name
        self.type = type
        self.amount = amount
        self.currency = currency
    }
}
