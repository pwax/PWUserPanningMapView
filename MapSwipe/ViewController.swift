//
//  ViewController.swift
//  MapSwipe
//
//  Created by Perry Waxman on 7/28/16.
//  Copyright © 2016 P.W. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    //MARK: - outlets
    @IBOutlet weak var mapView: PWUserPanningMapView!
    //MARK: - properties
    var locationManager = CLLocationManager()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //request location
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
        //create nav button
        let navButton = MKUserTrackingBarButtonItem(mapView: self.mapView)
        self.navigationItem.leftBarButtonItem = navButton
        
    }
    
    
    //MARK: - CLLocationManagerDelegate
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        switch status{
        case .AuthorizedAlways:
            //center to user location
            locationManager.startUpdatingLocation()
            mapView.setUserTrackingMode(MKUserTrackingMode.Follow, animated: true)
            
            break;
        case .AuthorizedWhenInUse:
            //center to user location
            locationManager.startUpdatingLocation()
            mapView.setUserTrackingMode(MKUserTrackingMode.Follow, animated: true)
            
            break;
        case .Denied:
            //error
            let deniedAlertController = UIAlertController(title: "Location Denied", message: "You won't to be able to use any location services.", preferredStyle: UIAlertControllerStyle.Alert)
            let okay = UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default, handler: nil)
            let settings = UIAlertAction(title: "Settings", style: .Default, handler: { (ACTION) -> Void in
                UIApplication.sharedApplication().openURL(NSURL(string:UIApplicationOpenSettingsURLString)!)
            })
            deniedAlertController.addAction(okay)
            deniedAlertController.addAction(settings)
            presentViewController(deniedAlertController, animated: true, completion: nil)
            
            break;
        case .NotDetermined:
            //
            break;
        case .Restricted:
            //error
            let restrictedAlert = UIAlertController(title: "Location Restricted", message: "Location services are restricted.", preferredStyle: UIAlertControllerStyle.Alert)
            let okay = UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default, handler: nil)
            restrictedAlert.addAction(okay)
            presentViewController(restrictedAlert, animated: true, completion: nil)
            break;
        }
        
    }


}

