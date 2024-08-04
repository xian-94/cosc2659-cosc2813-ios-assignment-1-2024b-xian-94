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
 - Sheet: https://developer.apple.com/documentation/swiftui/view/sheet(ispresented:ondismiss:content:)
 */

import Foundation
import SwiftUI

// TODO: ADD wine base if have time, complete UI later
struct Filter: View {
    
    // Track the state of rating, glass, and level
    @Binding var selectedRating: Int?
    @Binding var selectedLevel: String?
    @Namespace private var animation
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Button(action: {
                selectedLevel = nil
                selectedRating = nil
            }, label: {
                Text("Clear Filter")
            })
            .padding()
            Text("Choose Rating Range")
                .font(.custom("Raleway", size: 20))
                .fontWeight(.bold)
            RatingPicker(selectedRating: $selectedRating)
            // Level picker
            Text("Choose Level")
                .font(.custom("Raleway", size: 20))
                .fontWeight(.bold)
            LevelPicker(selectedLevel: $selectedLevel)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .frame(height: 350)
        .background(Color("background"))
        .clipShape(.rect(cornerRadius: 30))
        .padding(.horizontal, 20)
    }
}

