//
//  helper.swift
//  Presentation
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 9/11/22.
//

import Foundation

extension String {
    func localized(tableName: String) -> String {
        return NSLocalizedString(
            self,
            tableName: tableName,
            bundle: .main,
            value: self,
            comment: self
        )
    }
}
