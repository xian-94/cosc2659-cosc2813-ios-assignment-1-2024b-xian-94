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

// Create the Search bar components
struct SearchBar: View {
    // Bind the user input
    @Binding var text: String
    
    var body: some View {
        HStack {
            // Placeholder for user input
            TextField("Search...", text: $text)
                .font(.custom("Raleway", size: 15))
                .foregroundColor(Color("main-text"))
                .padding(.vertical, 10)
                .padding(.horizontal, 35)
                .frame(width: 300)
                .background(Color("shadow").opacity(0.2))
            // Display when no user input provided
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(Color("second-text"))
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                    }
                )
                .overlay(
                    // Adding style for search bar
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color("accent"), lineWidth: 0.5)
                        .frame(width: 300)
                )
        }
    }
    
}

struct SearchBar_Preview: PreviewProvider {
    static var previews: some View {
        StatefulPreviewWrapper("") {
            SearchBar(text: $0)
        }
    }
}

// Helper struct to manage State in Previews
struct StatefulPreviewWrapper<T: View>: View {
    @State private var value: String
    private let content: (Binding<String>) -> T
    
    init(_ initialValue: String, content: @escaping (Binding<String>) -> T) {
        _value = State(initialValue: initialValue)
        self.content = content
    }
    
    var body: some View {
        content($value)
    }
}
