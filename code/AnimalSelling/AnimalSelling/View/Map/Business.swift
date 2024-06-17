//
//  Business.swift
//  mlapp
//
//  Created by Thusith Hettiarachchi on 2024-06-07.
//

import Foundation
import MapKit

struct Business: Identifiable {
    let id = UUID()
    let name: String
    let placemark: MKPlacemark
    let coordinate: CLLocationCoordinate2D
    let phoneNumber: String
    let website: URL?
}
