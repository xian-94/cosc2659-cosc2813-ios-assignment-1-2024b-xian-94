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


// Create CategoryCard component
struct CategoryCard: View {
    // Attributes
    var category: Category
    // Control the chosen category
    @Binding var selected: Category?
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color(category.colorName))
            // Display frame based on the chosen state
                .frame(width: selected == category ? 80 : 70, height: selected == category ? 80 : 70)
                .cornerRadius(10)
            category.image
                .resizable()
                .frame(width: selected == category ? 60 : 50, height: selected == category ? 60 : 50)
        }
        .shadow(radius: selected == category ? 10 : 0)
        .animation(.spring(), value: selected)
        
    }
    
}


