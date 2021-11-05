//
//  DetailVC.swift
//  earthquakeAlertCenter
//
//  Created by Furkan Erzurumlu on 13.09.2021.
//

import UIKit
import Alamofire
import MapKit

class DetailVC: UIViewController {

    @IBOutlet weak var detailView: detailView!
    @IBOutlet weak var mapView: MKMapView!
    
    var viewModel = AlamofireWebservice()
    var mainData : Datum?
    
    var earthquakeData : Earthquake?
    
    let annotation = MKPointAnnotation()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        if let data = mainData {
            detailView.confDetail(detail: data)
            let locationLatitude = data.latitude
            let locationLongitude = data.longitude
            let location = CLLocation(latitude: locationLatitude, longitude: locationLongitude)
            let cordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 10000, longitudinalMeters: 10000)
            mapView.setRegion(cordinateRegion, animated: true)
            annotation.coordinate = CLLocationCoordinate2D(latitude: locationLatitude ?? 0.0, longitude: locationLongitude ?? 0.0)
            annotation.title = data.place
            mapView.addAnnotation(annotation)
            mapView.isZoomEnabled = true
            mapView.showAnnotations(self.mapView.annotations, animated: true)
            mapView.camera.altitude *= 40;
        }
        
        //self.detailView.confDetail(detail: mainData)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.async {
            self.detailView.roundCorners(corners: [.topLeft, .topRight], radius: 16)
        }
    }
}
