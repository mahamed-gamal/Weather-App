//
//  MapViewController.swift
//  Weather
//
//  Created by Mohamed Gamal on 7/24/19.
//  Copyright © 2019 ME. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController {
    
    var camera: GMSCameraPosition?
    
    lazy var marker: GMSMarker = {
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
        return marker
    }()
    
    lazy var mapView: GMSMapView = {
          let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera!)
        return mapView
    }()
    
    lazy var doneBtn: UIBarButtonItem = {
        return UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(dismissView))
    }()
    
    @objc func dismissView() {
        dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.setRightBarButton(doneBtn, animated: true)
        view = mapView
    }

}
