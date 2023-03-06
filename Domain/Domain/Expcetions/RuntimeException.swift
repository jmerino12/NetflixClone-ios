//
//  RuntimeException.swift
//  Domain
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 6/03/23.
//

import Foundation

public struct RuntimeError: Error {
    let message: String
    
    public init(_ message: String) {
        self.message = message
    }
    
    public var localizedDescription: String {
        message
    }
}
