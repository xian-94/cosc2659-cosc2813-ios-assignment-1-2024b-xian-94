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
