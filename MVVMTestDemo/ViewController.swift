//
//  ViewController.swift
//  MVVMTestDemo
//
//  Created by Ravi Parsa on 03/09/19.
//  Copyright © 2019 Ravi Parsa. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
var locatorViewModel: LocatorViewModel?
    private var animatorView: UIView?
    private let locationManager = CLLocationManager()
    
    var textCode = "12345"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.locatorViewModel = LocatorViewModel()
         getLocations()
        self.setUpHandler()
        
    }

    //MARK: - Functions
    
    func getLocations() {
        
        if !Reachability.isConnectedToNetwork() {
            self.popupAlert(title: "", message: Identifiers.Message.NoInternetConnectivity, actionTitles: ["Ok"], actions: [ {action1 in
                }, nil])
            return
        }
        //JCAnalyticsManager.shared.logEvent(eventName: "center_locator", parameters: ["search_zip": searchTextField.text!])
        if textCode != String() {
            self.animatorView = UIViewController.displaySpinner(onView: (self.view)!)
            self.callGetLocationAPI(pinCode: textCode)
        } else {
            self.animatorView = UIViewController.displaySpinner(onView: (self.view)!)
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
        }
    }
    
    func callGetLocationAPI(pinCode: String) {
        textCode = pinCode
        self.locatorViewModel!.pinCode = pinCode
        self.locatorViewModel!.getLocationList()
    }
    
    
    func setUpHandler() {
        locatorViewModel!.successViewClosure = { [weak self] (serviceType) in
            
            if (self?.animatorView) != nil {
                UIViewController.removeSpinner(spinner: (self?.animatorView)!)
            }
            
            switch serviceType {
            case .getLocation:
                if self?.locatorViewModel?.locatorModel == nil {
                    
  
                } else if (self?.locatorViewModel!.locatorModel?.count)! > 0 {
                    
                } else {
                    
                }
                
                print(self?.locatorViewModel!.locatorModel)
            }
        }
        
        locatorViewModel!.showAlertClosure = { [weak self] (message) in
            DispatchQueue.main.async {
                if (self?.animatorView) != nil {
                    UIViewController.removeSpinner(spinner: (self?.animatorView)!)
                }
                //show alert
                self?.popupAlert(title: "", message: message, actionTitles: ["Ok"], actions: [ {action1 in
                    }, nil])
            }
            } as ((String) -> Void)
    }

}


extension ViewController: CLLocationManagerDelegate {
    func locationManagerDidResumeLocationUpdates(_ manager: CLLocationManager) {
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        if (self.animatorView) != nil {
            UIViewController.removeSpinner(spinner: (self.animatorView)!)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        CLGeocoder().reverseGeocodeLocation(manager.location!, completionHandler: {(placemarks, error) -> Void in
            
            if (error != nil) {
                print("Reverse geocoder failed with error" + (error?.localizedDescription)!)
                return
            }
            
            if (placemarks?.count)! > 0 {
                let placemark = placemarks?[0]
                self.displayLocationInfo(placemark)
            } else {
                print("Problem with the data received from geocoder")
            }
        })
    }
    
    func displayLocationInfo(_ placemark: CLPlacemark?) {
        if let containsPlacemark = placemark {
            //stop updating location to save battery life
            locationManager.stopUpdatingLocation()
            //let locality = (containsPlacemark.locality != nil) ? containsPlacemark.locality : ""
            
            if let postalCode = containsPlacemark.postalCode {
                if (postalCode.count) > 0 {
                    self.callGetLocationAPI(pinCode: postalCode)
                }
            }
            
            //let administrativeArea = (containsPlacemark.administrativeArea != nil) ? containsPlacemark.administrativeArea : ""
            // let country = (containsPlacemark.country != nil) ? containsPlacemark.country : ""
            //            self.popupAlert(title:"", message: postalCode, actionTitles: ["Ok"], actions:[{action1 in
            //                }, nil])
        }
    }
}
