//
//  PermissionCheckerImpl.swift
//  Infraestructure
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 18/11/22.
//

import Foundation
import CoreLocation
import Domain

public class LocationPermissionCheckerImpl: LocationPermissionChecker {
    
    private let locationManager: CLLocationManager
    
    public init(locationManager: CLLocationManager) {
        self.locationManager = locationManager
    }
    
    public func checkPermission(completion : @escaping (Bool) -> Void) {
            let status = self.locationManager.authorizationStatus
            switch status {
            case .notDetermined, .restricted, .denied:
                completion(false)
                break
            case .authorizedAlways, .authorizedWhenInUse:
                completion(true)
                break
            default:
                completion(false)
                break
            }
        }
   
    }

