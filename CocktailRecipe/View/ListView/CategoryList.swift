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

import SwiftUI

// Create the CategoryList component

// TODO: Render items based on category later
struct CategoryList: View {
    // Track the chosen category
    @Binding var selectedCategory: Category?
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(categories) {
                        category in
                        CategoryCard(category: category, selected: $selectedCategory)
                            .onTapGesture {
                                // Deselect if chosen
                                if selectedCategory == category {
                                    selectedCategory = nil
                                }
                                else {
                                    // Select if not
                                    selectedCategory = category
                                }
                            }
                    }
                }
                .padding()
            }
            // Display the chosen category name
            if let selectedCategory = selectedCategory {
                Text(selectedCategory.name)
                    .font(.custom("Playfair Display", size: 30))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .italic()
                    .foregroundStyle(Color("primary-text"))
            }
            else {
                // Display all cocktails if not select category
                Text("All cocktails")
                    .font(.custom("Playfair Display", size: 30))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .italic()
                    .foregroundStyle(Color("primary-text"))
            }
        }
        
        
    }
    
}

