//
//  UserAnnotation.swift
//  Demo
//
//  Created by Victor Chen on 2019/10/20.
//  Copyright © 2019 Mt. Zendo All rights reserved.
//

import UIKit
import MapKit

enum AnnotationRegionSpan: Double {
    case small = 0.1
    case middle = 0.3
    case large = 0.6
}

class BaseAnnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    init(coordinate: CLLocationCoordinate2D, title: String?, subTitle: String?) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subTitle
    }
    
    func annotationRegion(span: AnnotationRegionSpan) -> MKCoordinateRegion {
        return MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: span.rawValue, longitudeDelta: span.rawValue))
    }
}
