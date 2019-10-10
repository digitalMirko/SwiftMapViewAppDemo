//
//  ViewController.swift
//  Mao View App
//
//  Created by Mirko Cukich on 10/7/19.
//  Copyright © 2019 Digital Mirko. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    // Coordinates - Willis Tower in Chicago, IL
    // 233 South Wacker Drive, Chicago, IL 60606, United States of America
    var latitude = 41.878872
    var longitude = -87.635909
    
    var manager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // when mapview loads up - Willis Tower
        // span of how far we zoomed in on map
        let span = MKCoordinateSpan.init(latitudeDelta: 0.01, longitudeDelta: 0.01)
        // Willis Tower area
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: latitude, longitude: longitude), span: span)
        mapView.setRegion(region, animated: true)
        
        // Map View Pin
        let pinLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        let pinObject = MKPointAnnotation()
        pinObject.coordinate = pinLocation
        pinObject.title = "Willis Tower"
        pinObject.subtitle = "233 South Wacker Drive, Chicago, IL"
        self.mapView.addAnnotation(pinObject)
        
        
        
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
        
        manager.delegate = self
        
        // req authorization from user then find location
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
        mapView.showsUserLocation = true 
        
        
    }
    
    // Map View Locations
    // call and update the map with our location
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let userLocation: CLLocation = locations[0] as CLLocation
        
        manager.stopUpdatingLocation()
        
        let location = CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
        
        // zoom in
        let span = MKCoordinateSpan.init(latitudeDelta: 0.01, longitudeDelta: 0.01)
        
        let region = MKCoordinateRegion(center: location, span: span)
        
        mapView.setRegion(region, animated: true)
        
    }
    
    @IBAction func directionsBtn(_ sender: Any) {
        
        // use Apple maps
        UIApplication.shared.open(URL(string: "http://maps.apple.com/maps?daddr=\(latitude),\(longitude)")!, options: [:], completionHandler: nil)
        
    }
    
}

