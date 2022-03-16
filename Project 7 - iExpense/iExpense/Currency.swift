//
//  Currency.swift
//  iExpense
//
//  Created by Christopher Fonseka on 16/03/2022.
//

import Foundation

enum Currency: String, Codable, CaseIterable, Identifiable {
    case poundSterling = "GBP"
    case usDollar = "USD"
    case euro = "EUR"
    case koreanWon = "KRW"
    case sriLankanRupee = "LKR"

    var id: String { self.rawValue }
}

extension Currency {
    
    private static var symbolMap: [Currency: String] {
        [
            .usDollar: "$",
            .poundSterling:"￡",
            .euro: "€",
            .koreanWon: "￦",
            .sriLankanRupee: "₨",
        ]
    }
    
    var symbol: String {
        Self.symbolMap[self]!
    }

    init?(symbol: String) {
        guard let entry = Self.symbolMap.first(where: { $1 == symbol }) else {
            return nil
        }
        self = entry.key
    }
}
