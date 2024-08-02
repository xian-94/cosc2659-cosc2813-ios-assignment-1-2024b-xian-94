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
//TODO: Change color, add real number of stars
struct Rating: View {
    // State to control the rating
    private var rating: Float
    @State private var currentRating: Int
    @State private var countRating: Int
    @State private var hasRated: Bool
    
    init(item: Item) {
        currentRating = 0
        countRating = item.numRatings
        hasRated = false
        rating = item.ratings
    }
    
    var body: some View {
        VStack {
            
            HStack {
                ForEach(1..<6) {
                    i in
                    Image(systemName: "star.fill")
                        .font(.title3)
                        .foregroundColor(currentRating >= i ? Color.yellow : Color.gray)
                    // Make the star rating clickable
                        .onTapGesture {
                            // If the user has rated, increase the rating by 1
                            if !hasRated {
                                currentRating = i
                                hasRated = true
                                countRating += 1
                            }
                            // If the user changes the number of stars, it doesn't affect the rating
                            else {
                                currentRating = i
                            }
                        }
                }
            }
            Spacer()
                .frame(height: 20)
            HStack {
                Image(systemName: "star.fill")
                    .font(.title3)
                    .foregroundColor(Color.yellow)
                Text(String(format: "%.1f", rating))
                    .font(.system(size: 20))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Text("(\(countRating))")
                    .font(.custom("Raleway", size: 20))
                    .foregroundColor(Color("second-text"))
            }
        }
    }
}

struct Rating_Preview: PreviewProvider {
    static var previews: some View {
        Rating(item: items[0])
    }
}
