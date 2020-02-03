//
//  LocationCell.swift
//  Demo
//
//  Created by Victor Chen on 2019/10/20.
//  Copyright © 2019 Mt. Zendo All rights reserved.
//

import UIKit
import MapKit

class LocationCell: BaseCell {

    @IBOutlet weak var streetLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var coutryLabel: UILabel!
    @IBOutlet weak var postCodeLabel: UILabel!
    @IBOutlet weak var timeZoneLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    var userAnnotation: UserAnnotation!
    override func setupData(_ user: User?) {
        guard user != nil else {
            return
        }
        guard let location = user?.location else {
            return
        }
        streetLabel.text = location.street.getStreet()
        cityLabel.text = location.state
        coutryLabel.text = location.country
        postCodeLabel.text = String(location.postcode)
        timeZoneLabel.text = location.timeZone.getTimeZone()
        let coordinate = CLLocationCoordinate2D(latitude: Double(location.coordinates.latitude ?? "0.0")!, longitude: Double(location.coordinates.longitude ?? "0.0")!)
        userAnnotation = UserAnnotation(coordinate: coordinate, title: user?.name?.lastName, subTitle: user?.name?.firstName)
        mapView.addAnnotation(userAnnotation)
        mapView.region = userAnnotation.annotationRegion(span: .small)
    }
    
    override func prepareForReuse() {
        streetLabel.text = nil
        cityLabel.text = nil
        coutryLabel.text = nil
        postCodeLabel.text = nil
        timeZoneLabel.text = nil
        mapView.removeAnnotation(userAnnotation)
    }
}
