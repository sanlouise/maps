//
//  ViewController.swift
//  Maps Demo
//
//  Created by Sandra Adams-Hallie on Mar/1/16.
//  Copyright © 2016 Sandra Adams-Hallie. All rights reserved.
//

import UIKit

//Import this
import MapKit

//Add delegate

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet var map: MKMapView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Zoom in to particular location
        
        var latitude:CLLocationDegrees = 52.179435
        var longitude:CLLocationDegrees = 5.289613
        
        
        //Difference between latitude/longitude of one side of the screen to the other, for zooming.
        
        var latDelta:CLLocationDegrees = 0.05
        
        var lonDelta: CLLocationDegrees = 0.05
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        
        let location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        //Combines span and location
        
        let region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        map.setRegion(region, animated: false)
        
        
        // Let the user mark places
        
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = location
        
        annotation.title = "Soest"
        
        annotation.subtitle = "Where I grew up"
        
        map.addAnnotation(annotation)
        
        // Let users pin their own annotations when clicking long.
        // Note the :, it is necessary to send the gestureRecognizer.
        
        let uilpgr = UILongPressGestureRecognizer(target: self, action: "action:")
        
        uilpgr.minimumPressDuration = 1.5
        
        map.addGestureRecognizer(uilpgr)

        
    }
    
    // This happens when the long press is recognized.
    
    // This function receives a variable called gestureRecognizer of type UIGestureRecognizer
    
    func action(gestureRecognizer: UIGestureRecognizer) {
        
        print("Gesture was recognized!")
        
        //Extract the data
        
        let touchPoint = gestureRecognizer.locationInView(self.map)
        
        let newCoordinate: CLLocationCoordinate2D = map.convertPoint(touchPoint, toCoordinateFromView: self.map)
        
        // Let the user mark places
        
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = newCoordinate
        
        annotation.title = "Soest"
        
        annotation.subtitle = "Where I grew up"
        
        map.addAnnotation(annotation)
        
        
        
    }
    
    
    
    
    
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

