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
// TODO: add wine base if have time
struct ItemListView: View {
    // Manage filter options by state
    @State private var searchQuery: String = ""
    @State private var selectedCategory: Category?
    @State private var ratingOption: Float?
    @State private var levelOption: String?
    
    // Display filter form
    @State private var showFilter: Bool = false
    
    // Filter the items given the query and filter options
    private func filterItems() -> [Item] {
        var filtered = items
        // Filter based on category
        if let selectedCategory = selectedCategory {
            filtered = filtered.filter { $0.category == selectedCategory.id }
        }
        // Filter based on rating
        if let ratingLimit = ratingOption {
            filtered = filtered.filter { $0.ratings >= ratingLimit }
        }
        // Filter based on level
        if let level = levelOption {
            filtered = filtered.filter { $0.level.lowercased() == level.lowercased() }
        }
        // Filter based on search query
        if !searchQuery.isEmpty {
            filtered = filtered.filter {
                $0.name.lowercased().contains(searchQuery.lowercased())
            }
        }
        return filtered
    }
    
    // Main body view
    var body: some View {
        NavigationView {
            ZStack {
                Color("background")
                    .ignoresSafeArea(.all)
                
                ScrollView {
                    VStack(spacing: 5) {
                        
                        HStack {
                            SearchBar(text: $searchQuery)
                            Button(action: {
                                // Click on the button to show the filter
                                showFilter.toggle()
                            }, label:
                            
                            {
                                Image(systemName: "line.3.horizontal.decrease.circle")
                                    .foregroundColor(Color("background"))
                                    .frame(width: 20, height: 20)
                                    .padding(3)
                            })
                            .controlSize(.regular)
                            .buttonBorderShape(.roundedRectangle(radius: 10))
                            .buttonStyle(.borderedProminent)
                            .tint(Color("cranberry"))
                        }
                        
                        Spacer()
                            .frame(height: 20)
                        // Display the category list
                        CategoryList(selectedCategory: $selectedCategory)
                        
                        Divider()
                            .frame(width: 200)
                            .background(Color("accent"))
                        Spacer()
                            .frame(height: 10)
                        // Item list
                        ItemList(items: filterItems())
                    }
                }
            }
        }
        .sheet(isPresented: $showFilter) {
            Filter(selectedRating: $ratingOption, selectedLevel: $levelOption)
        }
        
    }
    
}

struct ItemListView_Preview: PreviewProvider {
    static var previews: some View {
        ItemListView()
    }
}
