/*
 RMIT University Vietnam
 Course: COSC2659|COSC2813 iOS Development
 Semester: 2024B
 Assessment: Assignment 1
 Author: Truong Hong Van
 ID: 3957034
 Created  date: 20/7/2024
 Last modified:
 Acknowledgement:
 - Form: https://developer.apple.com/documentation/swiftui/form
 - Picker: https://developer.apple.com/documentation/swiftui/picker
 - Sheet: https://developer.apple.com/documentation/swiftui/view/sheet(ispresented:ondismiss:content:)
 */

import Foundation
import SwiftUI

// TODO: ADD wine base if have time, complete UI later
struct Filter: View {
    // Track the state of rating, glass, and level
    @Binding var selectedRating: Float?
    @Binding var selectedLevel: String?
    
    var body: some View {
        NavigationView {
            Form {
                // Rating section
                Section(header: Text("Rating")) {
                    Picker("Rating", selection: $selectedRating) {
                        // Add rating options with tag to compare later
                        Text("All Ratings").tag(nil as Int?)
                        ForEach(1..<6) {
                            rating in
                            Text(">= \(rating) Stars").tag(rating as Int?)
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                
                // Level section
                Section(header: Text("Level")) {
                    Picker("Level", selection: $selectedLevel) {
                        // Add rating options with tag to compare later
                        Text("All Levels").tag(nil as String?)
                        ForEach(["Easy", "Medium", "Hard"], id: \.self) {
                            level in
                            Text("\(level)").tag(level as String?)
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
            }
        }
        .navigationBarItems(trailing: Button("Done") {
            // Dismiss the sheet
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        })
    }
}

