//
//  AirportsViewController.swift
//  DVT Airport
//
//  Created by Koza, Sipho (RBI-UK) on 18/06/2019.
//  Copyright © 2019 Koza, Sipho (RBI-UK). All rights reserved.
//

import Foundation
import UIKit
import MapKit
import CoreLocation

class AirportsViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    private var mapView: MKMapView!
    private var locationManager = CLLocationManager()
    private var userlocation = CLLocationCoordinate2D()
    private let userlocationTitle: String = "My location"
    
    private var retrievedAirpots = [AirportModel]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        self.locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            self.locationManager.delegate = self
            self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
            self.locationManager.startUpdatingLocation()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.mapView = MKMapView()
        self.mapView.frame = CGRect(x: 0, y: 0, width: self.viewFrame.width, height: self.viewFrame.height)
        self.mapView.mapType = .standard
        self.mapView.isZoomEnabled = true
        self.mapView.isScrollEnabled = true
        self.mapView.delegate = self
        self.mapView.center = self.view.center
        self.view.addSubview(self.mapView)
    }
    
    @objc func takeMeToDestination() {
        
        let scheduleVC = ScheduleViewController()
        self.present(scheduleVC, animated: true, completion: nil)
        print("Button clicked...")
    }
    
    //MARK - MAP
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        //getting the first location
        let userLoc = locations[0] as CLLocation
        
        //stop updating the location
        manager.stopUpdatingLocation()
        
        //get the coordinates, create a span and geting the region
        let center = CLLocationCoordinate2D(latitude: userLoc.coordinate.latitude, longitude: userLoc.coordinate.longitude)
        
        //reason I made a latDelta adn lngDelta o.6, so I can get most of the aiports on the screen
        let span = MKCoordinateSpan(latitudeDelta: 0.6, longitudeDelta: 0.6)
        let region = MKCoordinateRegion(center: center, span: span)
        
        //set the region to the map
        self.mapView.setRegion(region, animated: true)
        
        //then remove all the annotations on the map so I can add new onces
        self.mapView.removeAnnotations(self.mapView.annotations)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = center
        annotation.title = self.userlocationTitle
        self.mapView.addAnnotation(annotation)
        
                let lat = Double(center.latitude).rounded(toPlaces: 6)
                let lng = Double(center.longitude).rounded(toPlaces: 6)
        
        
//        let annotationLocations = [
//            ["title": "Lanseria", "lat": -25.937843, "lng": 27.926432],
//            ["title": "Rand/Germiston", "lat": -26.140278, "lng": 28.242779],
//            ["title": "Oliver Reginald Tambo International (Jan Smuts International)", "lat": -26.132664, "lng": 28.231314]
//        ]
//
//        self.createAnnotations(locations: annotationLocations)
        
                Webservice().load(resource: AirportModel.fetch(lat: lat, lng: lng)) { result in

                    switch result {
                    case .failure(let error):
                        UIAlertController.buildDismissAlertController(title: "Error", message: error.errorMessage)

                    case .success(let airports):

                        DispatchQueue.main.async {
                            self.retrievedAirpots = [AirportModel]()
                            self.retrievedAirpots = airports
                            self.buildAirportAnnotations(airports: self.retrievedAirpots)
                        }
                    }
                }
    }
    
    
    
//    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//
//        let annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "pin")
//        if annotation is MKUserLocation {
//            return nil
//        }
//        annotationView.pinTintColor = UIColor.blue
//        return annotationView
//    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {

        for airport in retrievedAirpots {
            
            if let airportLat = Double(airport.latitudeAirport!) {
                if let airportLng = Double(airport.longitudeAirport!) {
                    if let viewLat = view.annotation?.coordinate.latitude {
                        if let viewLng = view.annotation?.coordinate.longitude {
                            
                            if airportLat == viewLat && airportLng == viewLng {
                                
                                let scheduleVC = ScheduleViewController()
                                
                                if let iataCode = airport.codeIataAirport {
                                    scheduleVC.airportIataCode = iataCode
                                    if let airportName = airport.nameAirport {
                                        scheduleVC.airportName = airportName
                                    }
                                    self.present(scheduleVC, animated: true, completion: nil)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    private func createAnnotations(locations: [Dictionary<String, Any>]) {
        
        for loc in locations {
            let ann = MKPointAnnotation()
            ann.title = loc["title"] as? String
            ann.coordinate = CLLocationCoordinate2D(latitude: (loc["lat"] as? CLLocationDegrees)!, longitude: (loc["lng"] as? CLLocationDegrees)!)
            ann.subtitle = "Airport"
            self.mapView.addAnnotation(ann)
        }
    }
    
    private func buildAirportAnnotations(airports: ([AirportModel])) {
        
        for airport in airports {
            
            let annotation = MKPointAnnotation()
            
            if let lat = Double(airport.latitudeAirport!) {
                if let lng = Double(airport.longitudeAirport!) {
                    annotation.title = airport.nameAirport
                    annotation.coordinate = CLLocationCoordinate2D(latitude: lat, longitude: lng)
                    self.mapView.addAnnotation(annotation)
                }
            }
        }
    }
    
    private func createPinView() -> MKAnnotationView {
        let annView = MKAnnotationView()
        annView.tintColor = .blue
        return annView
    }
    
}
