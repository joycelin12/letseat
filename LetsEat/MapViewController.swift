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
        initialize()

        // Do any additional setup after loading the view.
    }
    
    func initialize() {
        
        mapView.delegate = self
        
        manager.fetch { (annotations) in
            addMap(annotations)
        }
    }
    
    func addMap(_ annotations:[RestaurantItem]) {
    
        mapView.setRegion(manager.currentRegion(latDelta: 0.5, longDelta: 0.5), animated: true)
        mapView.addAnnotations(manager.annotations)
    }

    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
    
        self.performSegue(withIdentifier: Segue.showDetail.rawValue, sender: self )
    
    }
    
    func mapView(_ mapView:MKMapView, viewFor annotation:MKAnnotation) -> MKAnnotationView?
    {
        let identifier = "custompin"
        guard !annotation.isKind(of: MKUserLocation.self) else {
            return nil
        }
        
        var annotationView: MKAnnotationView?
        if let customAnnotationView =
            mapView.dequeueReusableAnnotationView(withIdentifier: identifier) {
            
            annotationView = customAnnotationView
            annotationView?.annotation = annotation
            
        } else {
            
            let av = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            av.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            annotationView = av
        }
        
        if let annotationView = annotationView{
        
            annotationView.canShowCallout = true
            annotationView.image = UIImage(named: "custom-annotation")
        }
        
        return annotationView
    }
   
}
