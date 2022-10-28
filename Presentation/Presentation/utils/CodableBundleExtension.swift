//
//  CodableBundleExtension.swift
//
//
//  Created by Jonathan Meriño Bolivar on 15/04/21.
//

import Foundation

extension Bundle{
    func decode<T: Codable>(_ file: String) -> T {
        // 1. Locate JSON FILE
        guard  let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bunlde")
        }
        // 2. Create a property for the data
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to lad \(file) from bundle")
        }
        // 3. Create a decodee
        let decoder = JSONDecoder()
        // 4. Create a property for the decoded data
        guard let decodedData = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle")
        }
        // 5. Return the ready-to-use data
        return decodedData
    }
}
