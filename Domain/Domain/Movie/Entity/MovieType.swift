//
//  MovieType.swift
//  Domain
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 23/11/22.
//

import Foundation

public struct MovieType {
    public let id: Int
    public let name: String
    
    public init(name: String, id: Int) {
        self.name = name
        self.id = id

    }
}
