//
//  MapViewFactory.swift
//  Weather
//
//  Created by Mohamed Gamal on 7/25/19.
//  Copyright © 2019 ME. All rights reserved.
//

import UIKit
import GoogleMaps

struct MapViewFactory {
    
    static func MakeMapWithNavigation() -> UIViewController{
        let vc  = MapViewController()
        let nav = UINavigationController(rootViewController: vc)
        vc.camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
        vc.marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude:  151.20)
        return nav
    }
    
    
    typealias Coordinates = (long: Double , lat: Double)
    static func MakeMapWith(_ coordinates: Coordinates) -> UIViewController{
        let vc = MapViewController()
        vc.camera = GMSCameraPosition.camera(withLatitude: coordinates.lat, longitude: coordinates.long, zoom: 6.0)
        vc.marker.position = CLLocationCoordinate2D(latitude: coordinates.lat, longitude: coordinates.long)
        return vc
    }
}
