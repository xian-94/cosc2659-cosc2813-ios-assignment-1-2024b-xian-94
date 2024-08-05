/*
 RMIT University Vietnam
 Course: COSC2659|COSC2813 iOS Development
 Semester: 2024B
 Assessment: Assignment 1
 Author: Truong Hong Van
 ID: 3957034
 Created  date: 20/7/2024
 Last modified: 04/08/2024
 Acknowledgement:
 Apple Developer (2024) NavigationLink, Apple Developer website, accessed 4 August 2024. https://developer.apple.com/documentation/swiftui/navigationlink
 Apple Developer (2024) Alert, Apple Developer website, accessed 4 August 2024.https://developer.apple.com/documentation/swiftui/alert
 Sofware Readers (2024) Navigation bar – A complete guide, Software Readers website, accessed 4 August 2024. https://softwareanders.com/swiftui-navigation-bar-a-complete-guide/
 Apple Developer (2024) Binding, Apple Developer website, accessed 4 August 2024. https://developer.apple.com/documentation/swiftui/binding
 Hudson P (2022) How to present a new view using sheet, Hacking with Swift website, accessed 4 August 2024. https://www.hackingwithswift.com/quick-start/swiftui/how-to-present-a-new-view-using-sheets
 Apple Developer (2024) LazyVGrid, Apple Developer website, accessed 4 August 2024.https://developer.apple.com/documentation/swiftui/lazyvgrid
 Ko J (13 January 2022) “Embed YouTube in SwiftUI”, Jacob’s Dev Blog¸ accessed 4 August 2024. https://jacobko.info/swiftui/swiftui-06/
 Apple Developer (2024) WKWebView, Apple Developer website, accessed 4 August 2024. https://developer.apple.com/documentation/webkit/wkwebview
 Apple Developer (2024) UIApplication, Apple Developer website, accessed 4 August 2024. https://developer.apple.com/documentation/uikit/uiapplication/1648685-open
 Apple Developer (2024) GeometryReader, Apple Developer website, accessed 4 August 2024. https://developer.apple.com/documentation/swiftui/geometryreader
 Google Fonts (2024) Raleway¸ Google Fonts website, accessed 4 August 2024. https://fonts.google.com/specimen/Raleway
 Google Fonts (2024) Playfair Display¸ Google Fonts website, accessed 4 August 2024. https://fonts.google.com/specimen/Playfair+Display
 Google Fonts (2024) Lobster¸ Google Fonts website, accessed 4 August 2024. https://fonts.google.com/specimen/Lobster
 Apple Developer (2024) AppStorage, Apple Developer website, accessed 4 August 2024. https://developer.apple.com/documentation/swiftui/appstorage
 */

import Foundation
import SwiftUI

// Main view: Navigation list of items view
struct ItemListView: View {
    // Manage system theme
    @State private var changeTheme: Bool = false
    @Environment(\.colorScheme) private var scheme: ColorScheme
    @AppStorage("user_theme") private var theme: Theme = .system
    
    // Manage filter options by state
    @State private var searchQuery: String = ""
    @State private var selectedCategory: Category?
    @State private var ratingOption: Int?
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
            filtered = filtered.filter { $0.ratings >= Float(ratingLimit) }
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
                    VStack {
                        Spacer()
                            .frame(height: 25)
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
                            .frame(height: 5)
                        // Display the category list
                        CategoryList(selectedCategory: $selectedCategory)
                        
                        Divider()
                            .frame(width: 200)
                            .background(Color("primary-text"))
                        Spacer()
                            .frame(height: 10)
                        // Item list
                        ItemList(items: filterItems())
                    }
                }
            }
            
            // Navigation bar
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                // App name
                ToolbarItem(placement: .principal) {
                    Text("LeTonneau")
                        .font(.custom("Lobster", size: 30))
                        .foregroundStyle(Color.cranberry)
                    //                        .offset(y: 10)
                        .padding()
                }
                // Theme changer
                ToolbarItem(placement:
                        .navigationBarTrailing) {
                            Button(action: {
                                // Present the ThemeManager
                                changeTheme.toggle()
                            }) {
                                Image(systemName: theme == .dark ?  "moon.stars" : "sun.max")
                                    .resizable()
                                    .frame(width: 35, height: 35)
                                    .foregroundColor(.mainText)
                            }
                        }
            }
        }
        
        .preferredColorScheme(theme.colorScheme)
        .navigationBarBackButtonHidden(true)
        .sheet(isPresented: $changeTheme, content: {
            ThemeManagerView(scheme: scheme)
                .presentationDetents([.height( 410)])
                .presentationBackground(.clear)
        })
        .sheet(isPresented: $showFilter) {
            Filter(selectedRating: $ratingOption, selectedLevel: $levelOption)
                .presentationDetents([.height(350)])
                .presentationBackground(.clear)
            
        }
        
    }
    
}

struct ItemListView_Preview: PreviewProvider {
    static var previews: some View {
        ItemListView()
    }
}
