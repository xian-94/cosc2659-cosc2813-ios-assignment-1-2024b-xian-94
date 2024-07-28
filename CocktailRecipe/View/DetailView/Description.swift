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

// TODO: Apply font and color later
struct Description: View {
    var item: Item
    private let slogan = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "
    var body: some View {
        VStack {
            Text(item.name)
                .font(.title)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            Spacer()
                .frame(height: 20)
            HStack {
                Text("Level")
                    .font(.headline)
                    .fontWeight(.medium)
                Text(item.level)
                
            }
            Spacer()
                .frame(height: 20)
            HStack {
                Text("Rating ")
                    .font(.headline)
                    .fontWeight(.medium)
                Rating()
            }
            .padding(.leading, 40)
            
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
      
    }
}

struct Description_Preview: PreviewProvider {
    static var previews: some View {
        Description(item: items[0])
    }
}
