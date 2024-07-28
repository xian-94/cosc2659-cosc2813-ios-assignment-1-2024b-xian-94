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

// Clickable star rating for item
//TODO: Change color 
struct Rating: View {
    // State to control the rating
    @State var rating: Int = 0
    
    var body: some View {
        ZStack {
            HStack {
                ForEach(1..<6) {
                    i in
                    Image(systemName: "star.fill")
                        .font(.title3)
                        .foregroundColor(rating >= i ? Color.yellow : Color.gray)
                    // Make the star rating clickable
                        .onTapGesture {
                            rating = i
                        }
                }
            }
        }
    }
}

struct Rating_Preview: PreviewProvider {
    static var previews: some View {
        Rating()
    }
}
