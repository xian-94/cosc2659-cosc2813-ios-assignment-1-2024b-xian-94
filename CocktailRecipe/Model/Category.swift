/*
 RMIT University Vietnam
 Course: COSC2659|COSC2813 iOS Development
 Semester: 2024B
 Assessment: Assignment 1
 Author: Truong Hong Van
 ID: 3957034
 Created  date: 20/7/2024
 Last modified:
 Acknowledgement: 
 - Compare object: https://developer.apple.com/documentation/swift/equatable
 */

import Foundation
import SwiftUI


// Create Category object and its attributes
struct Category: Identifiable, Codable, Equatable {
    var id: Int
    var name: String
    var imageName: String
    var image: Image {
        Image(imageName)
    }
    var colorName: String
    
    // Conform to Equatable protocol - Function to compare objects
    static func == (obj1: Category, obj2: Category) -> Bool {
        return obj1.id == obj2.id;
    }
}
