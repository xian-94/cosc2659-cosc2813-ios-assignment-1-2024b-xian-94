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

// Create the Item object and its attributes
struct Item: Identifiable, Codable {
    var id: Int
    var name: String
    var category: Int
    var level: String
    var base: String
    var imageName: String
    // Collection of images
    var collection: [String]
    var ratings: Float
    var numRatings: Int
    var description: String
    var ingredients: [Ingredient]
    var instruction: [String]
    var video: String
    var image: Image {
        Image(imageName)
    }
    var location: Location
   
}

// Coordinates and address of physical location
// URL of online location
struct Location: Codable {
    var latitude: Double
    var longitude: Double
    var address: String
    var name: String
    var shoppee: String
    var facebook: String
    // Location coordination object
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
}



