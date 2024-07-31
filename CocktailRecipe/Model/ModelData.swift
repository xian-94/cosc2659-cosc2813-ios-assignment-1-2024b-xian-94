/*
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
import CoreLocation


// Decode JSON file into a struct
// Load category data
func loadCategories(fileName: String) -> [Category] {
    if let file = Bundle.main.url(forResource: fileName, withExtension: nil) {
        if let data = try? Data(contentsOf: file) {
            do {
                let decoder = JSONDecoder()
                let decoded = try decoder.decode([Category].self, from: data)
                return decoded
            } catch let error {
                fatalError("Failed to decode JSON: \(error)")
            }
        }
    } else {
        fatalError("Couldn't load \(fileName) file ")
    }
    return [] as [Category]
}

// Load item data
func loadItems(fileName: String) -> [Item] {
    if let file = Bundle.main.url(forResource: fileName, withExtension: nil) {
        if let data = try? Data(contentsOf: file) {
            do {
                let decoder = JSONDecoder()
                let decoded = try decoder.decode([Item].self, from: data)
                return decoded
            } catch let error {
                fatalError("Failed to decode JSON: \(error)")
            }
        }
    } else {
        fatalError("Couldn't load \(fileName) file")
    }
    return [] as [Item]
}


// Import data
var categories = loadCategories(fileName: "categories.json")
var items = loadItems(fileName: "items.json")


