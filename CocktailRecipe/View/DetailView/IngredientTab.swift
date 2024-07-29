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
 - Grid: https://developer.apple.com/documentation/swiftui/grid
 */

import Foundation
import SwiftUI

// TODO: Add style and portions if have time,  done state
// Ingredeident tab content
struct IngredientTab: View {
    
    // The cases for sorting
    enum SortOrder {
        case nameAscending, nameDescending, quantityAscending, quantityDescending
    }
    
    // Control the ingredient for the table
    @State private var ingredients: [Ingredient]
    // Allow user to sort the list
    @State private var sortOrder: SortOrder = .nameAscending
    // Change the arrow image depending on the sort
    @State private var sortArrowName: String = "arrow.up"
    @State private var sortArrowQuantity: String = "arrow.up"
    
    // Set the initial state for ingredient list
    init(ingredients: [Ingredient]) {
        _ingredients = State(initialValue: ingredients)
    }
    
    // Handle sorting based on case
    private func sortIngredients() -> [Ingredient] {
        switch sortOrder {
        case .nameAscending:
            // Ascending: the first name value is smaller than the second
            return ingredients.sorted { $0.name < $1.name }
        case .nameDescending:
            // Descending: the first name value is larger than the second
            return ingredients.sorted { $0.name > $1.name }
        case .quantityAscending:
            return ingredients.sorted { $0.quantity < $1.quantity }
        case .quantityDescending:
            return ingredients.sorted { $0.quantity > $1.quantity }
        }
    }
    
    // Handle toggle sorting for sort button
    private func toggleSort(for column: String ) {
        switch column {
        case "name":
            // Switch to descending name if the current is ascending and in reverse
            if sortOrder == .nameAscending {
                sortOrder = .nameDescending
                sortArrowName = "arrow.down"
            } else {
                sortOrder = .nameAscending
                sortArrowName = "arrow.up"
            }
            break
        case "quantity":
            if sortOrder == .quantityAscending {
                sortOrder = .quantityDescending
                sortArrowQuantity = "arrow.down"
            } else {
                sortOrder = .quantityAscending
                sortArrowQuantity = "arrow.up"
            }
            break
        default:
            sortOrder = sortOrder
        }
    }
    
    // Main view
    var body: some View {
        VStack(alignment: .leading) {
            // Table header
            HStack {
                HStack {
                    Button(action: {toggleSort(for: "name")}) {
                        Image(systemName: sortArrowName)
                    }
                    Text("Name")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }
                Spacer()
                HStack {
                    Button(action: {
                        toggleSort(for: "quantity")
                    }) {
                        Image(systemName: sortArrowQuantity)
                    }
                    Text("Quantity")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }
            }
            .padding()
            
            Divider()
            
            // Table Rows
            List {
                ForEach(sortIngredients()) {
                    ingredient in
                    HStack {
                        Text(ingredient.name)
                        Spacer()
                        Text(String(format: "%.1f", ingredient.quantity))
                        Text(ingredient.unit)
                    }
                    
                }
            }
            .listStyle(PlainListStyle())
        }
    }
}

struct Ingredient_Preview: PreviewProvider {
    static var previews: some View {
        IngredientTab(ingredients: ingredients)
    }
}
