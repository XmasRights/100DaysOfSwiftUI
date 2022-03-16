//
//  Expenses.swift
//  iExpense
//
//  Created by Christopher Fonseka on 16/03/2022.
//

import Foundation

class Expenses: ObservableObject {

    @Published var items: [ExpenseItem] = []
}
