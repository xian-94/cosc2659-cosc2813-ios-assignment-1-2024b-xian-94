/*
 RMIT University Vietnam
 Course: COSC2659|COSC2813 iOS Development
 Semester: 2024B
 Assessment: Assignment 1
 Author: Truong Hong Van
 ID: 3957034
 Created  date: 20/7/2024
 Last modified: 04/08/2024
 Acknowledgement:
 Apple Developer (2024) NavigationLink, Apple Developer website, accessed 4 August 2024. https://developer.apple.com/documentation/swiftui/navigationlink
 Apple Developer (2024) Alert, Apple Developer website, accessed 4 August 2024.https://developer.apple.com/documentation/swiftui/alert
 Sofware Readers (2024) Navigation bar – A complete guide, Software Readers website, accessed 4 August 2024. https://softwareanders.com/swiftui-navigation-bar-a-complete-guide/
 Apple Developer (2024) Binding, Apple Developer website, accessed 4 August 2024. https://developer.apple.com/documentation/swiftui/binding
 Hudson P (2022) How to present a new view using sheet, Hacking with Swift website, accessed 4 August 2024. https://www.hackingwithswift.com/quick-start/swiftui/how-to-present-a-new-view-using-sheets
 Apple Developer (2024) LazyVGrid, Apple Developer website, accessed 4 August 2024.https://developer.apple.com/documentation/swiftui/lazyvgrid
 Ko J (13 January 2022) “Embed YouTube in SwiftUI”, Jacob’s Dev Blog¸ accessed 4 August 2024. https://jacobko.info/swiftui/swiftui-06/
 Apple Developer (2024) WKWebView, Apple Developer website, accessed 4 August 2024. https://developer.apple.com/documentation/webkit/wkwebview
 Apple Developer (2024) UIApplication, Apple Developer website, accessed 4 August 2024. https://developer.apple.com/documentation/uikit/uiapplication/1648685-open
 Apple Developer (2024) GeometryReader, Apple Developer website, accessed 4 August 2024. https://developer.apple.com/documentation/swiftui/geometryreader
 Google Fonts (2024) Raleway¸ Google Fonts website, accessed 4 August 2024. https://fonts.google.com/specimen/Raleway
 Google Fonts (2024) Playfair Display¸ Google Fonts website, accessed 4 August 2024. https://fonts.google.com/specimen/Playfair+Display
 Google Fonts (2024) Lobster¸ Google Fonts website, accessed 4 August 2024. https://fonts.google.com/specimen/Lobster
 Apple Developer (2024) AppStorage, Apple Developer website, accessed 4 August 2024. https://developer.apple.com/documentation/swiftui/appstorage
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
