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

// Create the Item object and its attributes
// TODO: Modify ID to UUID
struct Ingredient: Identifiable, Codable {
    var id: UUID
    var name: String
    var quantity: Double
    var unit: String
}


