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
    // Manage search query
    @State private var searchQuery: String = ""
    // Filter the items given the query
    private func filterItems() -> [Item] {
        if searchQuery.isEmpty {
            return items
        }
        else {
            return items.filter {
                $0.name.lowercased().contains(searchQuery.lowercased())
            }
        }
    }
    var body: some View {
        NavigationView {
            ScrollView {
                ZStack {
                    Color("background")
                        .ignoresSafeArea(.all)
                    VStack {
                        SearchBar(text: $searchQuery)
                        Spacer()
                            .frame(height: 20)
                        CategoryList()
                        ItemList(items: filterItems())
                    }
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
