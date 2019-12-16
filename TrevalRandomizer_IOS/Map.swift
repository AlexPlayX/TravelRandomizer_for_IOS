//
//  Map.swift
//  TRfIOS
//
//  Created by Alexey on 12/5/19.
//  Copyright © 2019 Алексей. All rights reserved.
//

import Foundation
import  UIKit
import MapKit
import CoreLocation


class Mapin: UIViewController {

    @IBOutlet var map: MKMapView!

       override func viewDidLoad() {
                    var latilube = 50.448853
                    var logitube = 30.513346
                    var cityTitle = "Kiev"
                    var cantryTitle = "Ukrain"
                    let location = CLLocationCoordinate2DMake(latilube, logitube)
                    let span = MKCoordinateSpan(latitudeDelta: 0.030, longitudeDelta: 0.030)
                    let region = MKCoordinateRegion(center: location, span: span)
                    map.region = region
                    let annotation = MKPointAnnotation()
                    annotation.coordinate  =  location
                    annotation.title =  cityTitle
                    annotation.subtitle = cantryTitle
                    map.addAnnotation(annotation)
            super.viewDidLoad()
        }
}
