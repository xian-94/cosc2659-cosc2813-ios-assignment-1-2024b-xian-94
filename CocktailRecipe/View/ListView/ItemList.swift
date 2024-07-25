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
    
    var body: some View {
        NavigationView {
            HStack {
                List(items) {
                    item in
                    NavigationLink {
                        ItemCard(item: item)
                    } label: {
                        ItemCard(item: item)
                    }
                }
            }
           
        }
    }
}

// Preview the content
struct ItemList_Preview: PreviewProvider {
    static var previews: some View {
        ItemList()
    }
}

