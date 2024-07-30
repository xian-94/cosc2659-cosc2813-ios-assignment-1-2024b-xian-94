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

import Foundation
import SwiftUI

// Create the ItemList component to display the list of items
struct ItemList: View {
    var items: [Item]
    // Define 2 columns with flexible width in a row
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        // Build the grid layout for the item list
        LazyVGrid(columns: columns, spacing: 20, content: {
            ForEach(items, content: {
                item in
                NavigationLink(destination: ItemDetailView(item: item)){
                    ItemCard(item: item)
                        .foregroundColor(.black)
                }
            })
        })
    }
    
}

// Preview the content
struct ItemList_Preview: PreviewProvider {
    static var previews: some View {
        ItemList(items: items)
    }
}

