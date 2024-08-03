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


struct Description: View {
    var item: Item
    var body: some View {
        VStack {
            // Item name
            Text(item.name)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .font(.custom("Playfair Display", size: 25))
                .foregroundColor(Color("main-text"))
            Spacer()
                .frame(height: 10)
            // Rating
            HStack {
                Image(systemName: "star.fill")
                    .font(.title3)
                    .foregroundColor(Color.yellow)
                Text(String(format: "%.1f", item.ratings))
                    .font(.system(size: 18))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(Color("main-text"))
                Text("(\(item.numRatings))")
                    .font(.custom("Raleway", size: 20))
                    .foregroundColor(Color("second-text"))
            }
            Spacer()
                .frame(height: 20)
            // Item description
            Text(item.description)
                .font(.custom("Raleway", size: 15))
                .foregroundColor(Color("main-text"))
            Spacer()
                .frame(height: 20)
            // Other information
            HStack(spacing: 40) {
                Text("Level")
                    .font(.custom("Raleway", size: 15))
                    .fontWeight(.medium)
                    .foregroundColor(Color("main-text"))
                Text(item.level)
                    .font(.custom("Raleway", size: 15))
                    .foregroundColor(Color("main-text"))
                
            }
            Spacer()
                .frame(height: 20)
            HStack(spacing: 40) {
                Text("Glass")
                    .font(.custom("Raleway", size: 15))
                    .fontWeight(.medium)
                    .foregroundColor(Color("main-text"))
                Text("\(item.glass)")
                    .font(.custom("Raleway", size: 15))
                    .foregroundColor(Color("main-text"))
                    
                
            }
        }
        .padding()
        
    }
}

struct Description_Preview: PreviewProvider {
    static var previews: some View {
        Description(item: items[0])
    }
}
