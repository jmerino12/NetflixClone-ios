//
//  User.swift
//  Domain
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 29/11/22.
//

import Foundation


public struct User {
    private var name: String = ""
    private let age: Int
    
    public init(age: Int) {
        self.age = age
    }
    
    func isAdult() -> Bool {
        return self.age >= 18
    }
    
    mutating func setName(name: String) {
        self.name = name
    }
}

