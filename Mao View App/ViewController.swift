//
//  ViewController.swift
//  Mao View App
//
//  Created by Mirko Cukich on 10/7/19.
//  Copyright © 2019 Digital Mirko. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    // Coordinates - Willis Tower in Chicago, IL
    // 233 South Wacker Drive, Chicago, IL 60606, United States of America
    var latitude = 41.878872
    var longitude = -87.635909

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // when mapview loads up - Willis Tower
        // span of how far we zoomed in on map
        let span = MKCoordinateSpan.init(latitudeDelta: 0.01, longitudeDelta: 0.01)
        // Willis Tower area
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: latitude, longitude: longitude), span: span)
        mapView.setRegion(region, animated: true)
        
        
        
    }
    
    @IBAction func standardBtn(_ sender: Any) {
        
        mapView.mapType = MKMapType.standard
        
        
    }
    
    @IBAction func satelliteBtn(_ sender: Any) {
        
        mapView.mapType = MKMapType.satellite
        
    }
    
    
    @IBAction func hybridBtn(_ sender: Any) {
        
        mapView.mapType = MKMapType.hybrid
    }
    
    
    @IBAction func locateBtn(_ sender: Any) {
        
        
    }
    
    @IBAction func directionsBtn(_ sender: Any) {
        
        
    }
    
}

