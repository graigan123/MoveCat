//
//  LocationMap.swift
//  SysZone
//
//  Created by tmp_user on 02/01/19.
//  Copyright © 2019 tmp_user. All rights reserved.
//

import Foundation
import MapKit

class CurrentLocalization {
    
    static func fetchCityAndCountry(from location: CLLocation, completion: @escaping (_ city: String?, _ country:  String?, _ error: Error?) -> ()) {
        CLGeocoder().reverseGeocodeLocation(location) { placemarks, error in
            completion(placemarks?.first?.locality,
                       placemarks?.first?.country,
                       error)
        }
    }
    
    static func currentLocale() {
        
        
        let locationManager = CLLocationManager()
        
        
        
    }
}
