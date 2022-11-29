//
//  LocationRepository.swift
//  Domain
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 18/11/22.
//

import Foundation


public protocol LocationRepository {
    func findLastRegion(completion : @escaping (String) -> Void)
}
