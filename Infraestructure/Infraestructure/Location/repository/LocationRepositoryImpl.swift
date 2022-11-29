//
//  LocationRepositoryImpl.swift
//  Infraestructure
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 18/11/22.
//

import Foundation
import CoreLocation
import Domain


public class LocationRepositoryImpl: /*NSObject,*/ LocationRepository /*, CLLocationManagerDelegate*/ {
    
    private let permissionChecker: LocationPermissionCheckerImpl
    private let locationManager: CLLocationManager
    
    public init(permissionChecker: LocationPermissionCheckerImpl, locationManager: CLLocationManager) {
        self.permissionChecker = permissionChecker
        self.locationManager = locationManager
        //super.init()
        //self.locationManager.delegate = self
        //self.locationManager.requestAlwaysAuthorization()
    }
    
    
    public func findLastRegion(completion : @escaping (String) -> Void) {
        permissionChecker.checkPermission { result in
            if result {
                let userLocation:CLLocation = CLLocation(latitude: self.locationManager.location!.coordinate.latitude, longitude: self.locationManager.location!.coordinate.longitude) as CLLocation
                let geocoder = CLGeocoder()
                geocoder.reverseGeocodeLocation(userLocation) { (placemarks, error) in
                    if (error != nil){
                        print("error in reverseGeocode")
                    }
                    let placemark = placemarks! as [CLPlacemark]
                    if placemark.count>0{
                        let placemark = placemarks![0]
                        completion(placemark.isoCountryCode ?? "US")
                    }
                }
            }else {
                completion("US")
            }
            
        }
    }
    
    

}

