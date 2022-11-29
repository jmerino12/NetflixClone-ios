//
//  PermissionChecker.swift
//  Domain
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 18/11/22.
//

import Foundation


public protocol LocationPermissionChecker {
    func checkPermission(completion : @escaping (Bool) -> Void)
}
