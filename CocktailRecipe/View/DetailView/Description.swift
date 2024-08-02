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

// TODO: Apply font and color later, add description to the Item model
struct Description: View {
    var item: Item
    var body: some View {
        VStack {
            Text(item.name)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .font(.custom("Playfair Display", size: 25))
            Spacer()
                .frame(height: 10)
            Rating(item: item)
            Spacer()
                .frame(height: 20)
            Text(item.description)
                .font(.custom("Raleway", size: 15))
            Spacer()
                .frame(height: 20)
            HStack(spacing: 20) {
                Text("Level")
                    .font(.custom("Raleway", size: 15))
                    .fontWeight(.medium)
                Text(item.level)
                    .font(.custom("Raleway", size: 15))
                
            }
            Spacer()
                .frame(height: 20)
            HStack(spacing: 20) {
                Text("Glass")
                    .font(.custom("Raleway", size: 15))
                    .fontWeight(.medium)
                Text("\(item.glass)")
                    .font(.custom("Raleway", size: 15))
                    
                
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
