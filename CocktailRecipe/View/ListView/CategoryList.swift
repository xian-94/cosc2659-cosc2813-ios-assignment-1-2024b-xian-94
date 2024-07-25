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
    var body: some View {
        HStack {
            ForEach(categories) {
                category in
                CategoryCard(category: category)
            }
        }
    }
    
}

// Preview the content 
struct CategoryList_Previews: PreviewProvider {
    static var previews: some View {
        CategoryList()
    }
}
