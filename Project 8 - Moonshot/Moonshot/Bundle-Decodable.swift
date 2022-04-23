//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by Christopher Fonseka on 23/04/2022.
//

import Foundation

extension Bundle {

    func decode(_ file: String) -> [String: Astronaut] {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError()
        }

        let decoder = JSONDecoder()
        guard let loaded = try? decoder.decode([String: Astronaut].self, from: data) else {
            fatalError()
        }
        return loaded
    }
}
