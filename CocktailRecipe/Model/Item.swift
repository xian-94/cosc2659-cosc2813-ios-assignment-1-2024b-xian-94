//
//  Item.swift
//  CocktailRecipe
//
//  Created by Do Le Long An on 25/7/24.
//

import Foundation
import SwiftUI

// Create the Item object and its attributes
// TODO: Modify ID to UUID
struct Item: Identifiable, Codable {
    var id: Int
    var name: String
    var category: Category
    var level: String
    var time: Int
    var imageName: String
    var image: Image {
        Image(imageName)
    }
    
}

var items = [
    Item(id: 1, name: "Tequila Sunrise", category: categories[1], level: "Easy", time: 15, imageName: "demo"),
    Item(id: 2, name: "Tequila Sunrise", category: categories[1], level: "Easy", time: 15, imageName: "demo"),
    Item(id: 3, name: "Tequila Sunrise", category: categories[1], level: "Easy", time: 15, imageName: "demo")


]
