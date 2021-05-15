//
//  MapViewController.swift
//  LetsEat
//
//  Created by Peiyu Joyce Lin Williamson on 5/14/21.
//  Copyright © 2021 Williamson. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet var mapView: MKMapView!
    
    let manager = MapDataManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        initializa()

        // Do any additional setup after loading the view.
    }
    
    func initializa() {
        manager.fetch { (annotations) in
            addMap(annotations)
        }
    }
    
    func addMap(_ annotations:[RestaurantItem]) {
    
        mapView.setRegion(manager.currentRegion(latDelta: 0.5, longDelta: 0.5), animated: true)
        mapView.addAnnotations(manager.annotations)
    }
   
}
