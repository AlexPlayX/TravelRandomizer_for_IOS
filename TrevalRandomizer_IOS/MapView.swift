//
//  MapView.swift
//  TrevalRandomizer_IOS
//
//  Created by Alexey on 11/21/19.
//  Copyright © 2019 Алексей. All rights reserved.
//

import Foundation
import UIKit
import MapKit
import CoreLocation

class MapView: UIViewController{
    @IBOutlet var map: MKMapView!
    @IBAction func randPlace(_ sender: NSLock) {
        let api:ApiWork = ApiWork()
        let contry = api.randomize()
        repeat {
            let loc:(urli:String,text:String,lat:Double,log:Double) = api.apiOpenInfo(contry: contry.contry)
                if (cordin.count != 0){
                        let _ = mapingConstract(latilube: loc.lat, logitube: loc.log, cityTitle: contry.city, cantryTitle: contry.contry)
                }
            } while(cordin.count == 0)
            viewDidLoad()

        }

    @IBAction func testLondon(_ sender: NSLock) {
        let _ = mapingConstract(latilube:51.5085300 , logitube:-0.1257400, cityTitle:"London" , cantryTitle:"Britan" )

    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    private func mapingConstract(latilube:Double, logitube:Double, cityTitle:String, cantryTitle:String) -> (Bool){
        let location = CLLocationCoordinate2DMake(latilube, logitube)
        let span = MKCoordinateSpan(latitudeDelta: 0.100, longitudeDelta: 0.100)
        let region = MKCoordinateRegion(center: location, span: span)
        map.region = region
        let annotation = MKPointAnnotation()
        annotation.coordinate  =  location
        annotation.title =  cityTitle
        annotation.subtitle = cantryTitle
        map.addAnnotation(annotation)
        return true
    }

}


