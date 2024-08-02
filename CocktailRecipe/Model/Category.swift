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


// Create Category object and its attributes
struct Category: Identifiable, Codable {
    var id: Int
    var name: String
    var imageName: String
    var image: Image {
        Image(imageName)
    }
    var colorName: String
}
