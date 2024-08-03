/*
 RMIT University Vietnam
 Course: COSC2659|COSC2813 iOS Development
 Semester: 2024B
 Assessment: Assignment 1
 Author: Truong Hong Van
 ID: 3957034
 Created  date: 20/7/2024
 Last modified:
 Acknowledgement: Acknowledge the resources that you use here.
 */

import Foundation
import SwiftUI
import CoreLocation

// Create the Store object and its attributes
struct Store: Identifiable, Codable {
    var id: Int
    var name: String
    var address: String
    var description: String
    var coordinates: Coordinates
    // Location coordination object and image object
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
    }
}

// Coordinates of location
struct Coordinates: Codable {
    var latitude: Double
    var longitude: Double
}

