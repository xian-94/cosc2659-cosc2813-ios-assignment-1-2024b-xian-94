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
// TODO: Modify name font later
// TODO: Category name appear in the center when clicked on the image
struct CategoryCard: View {
    // Attributes
    var category: Category
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color(category.colorName))
                .frame(width: 70, height: 70)
                .cornerRadius(10)
            category.image
                .resizable()
                .frame(width: 50, height: 50)
        }
        
        
    }
    
}

// Preview the component
struct CategoryCard_Preview: PreviewProvider {
    static var previews: some View {
        CategoryCard(category: categories[1])
        
    }
}

