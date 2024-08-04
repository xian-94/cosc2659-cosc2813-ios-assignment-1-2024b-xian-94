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
    init(item: Item) {
        _ingredients = State(initialValue: item.ingredients)
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
        
        VStack {
            // Table header
            HStack {
                HStack {
                    Button(action: {toggleSort(for: "name")}) {
                        Image(systemName: sortArrowName)
                    }
                    Text("Name")
                        .fontWeight(.bold)
                        .font(.custom("Raleway", size: 18))
                        .foregroundColor(Color("main-text"))
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
                        .font(.custom("Raleway", size: 18))
                        .foregroundColor(Color("main-text"))
                }
            }
            .padding(.horizontal)
            Divider()
            
            // Table Rows
            VStack(alignment: .center, spacing: 5) {
                ForEach(sortIngredients()) {
                    ingredient in
                    HStack {
                        Text(ingredient.name)
                            .font(.custom("Raleway", size: 15))
                            .foregroundColor(Color("main-text"))
                        Spacer()
                        Text(String(format: "%.1f", ingredient.quantity))
                            .font(.custom("Raleway", size: 15))
                            .foregroundColor(Color("main-text"))
                            .fontWeight(.medium)
                        Spacer()
                            .frame(width: 5)
                        Text(ingredient.unit)
                            .font(.custom("Raleway", size: 15))
                            .foregroundColor(Color("main-text"))
                    }
                    Divider()
                }
            }
            .padding()
        }
        .padding()
        
    }
}



struct Ingredient_Preview: PreviewProvider {
    static var previews: some View {
        IngredientTab(item: items[0])
    }
}
