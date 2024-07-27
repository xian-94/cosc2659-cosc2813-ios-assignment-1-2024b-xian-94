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

// Main view: Navigation list of items view
struct ItemListView: View {
    var body: some View {
        ScrollView {
            ZStack {
                Color(.white)
                    .ignoresSafeArea(.all)
                VStack {
                    StatefulPreviewWrapper("") {
                        SearchBar(text: $0)
                    }
                    Spacer()
                        .frame(height: 20)
                    CategoryList()
                    ItemList()
                    
                }
            }
        }
    }
    
}

struct ItemListView_Preview: PreviewProvider {
    static var previews: some View {
        ItemListView()
    }
}
