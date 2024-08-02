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
    @State var selectedCategory: Category?
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
        HStack {
                ForEach(categories) {
                    category in
                    CategoryCard(category: category)
                        .onTapGesture {
                            selectedCategory = category
                        }
                }
            }
        .padding()
        }
        if let selectedCategory = selectedCategory {
            Text(selectedCategory.name)
                .font(.custom("Playfair Display", size: 30))
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .italic()
        }
    }
    
}

// Preview the content 
struct CategoryList_Previews: PreviewProvider {
    static var previews: some View {
        CategoryList()
    }
}
