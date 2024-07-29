//
//  Ingredient.swift
//  CocktailRecipe
//
//  Created by Do Le Long An on 28/7/24.
//

import Foundation
import SwiftUI

// Create the Item object and its attributes
// TODO: Modify ID to UUID
struct Ingredient: Identifiable, Codable {
    var id: Int
    var name: String
    var quantity: Double
    var unit: String
}

var ingredients = [
    Ingredient(id: 1, name: "Mint", quantity: 10, unit: "leaves"),
    Ingredient(id: 2, name: "Lime juice", quantity: 30, unit: "ml"),
    Ingredient(id: 3, name: "White Rum", quantity: 60, unit: "ml")
]
