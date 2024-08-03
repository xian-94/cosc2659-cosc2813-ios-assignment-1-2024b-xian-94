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

// Create the ItemDetail component
struct ItemCard : View  {
    var item: Item
    
    var body: some View {
        VStack {
            ZStack {
                ZStack {
                    // Shadow effect
                    Rectangle()
                        .fill(Color("shadow"))
                        .opacity(0.4)
                        .frame(width: 50, height: 15)
                        .cornerRadius(20)
                        .scaleEffect(x:2, y: 1)
                        .offset(x: -10, y: 20)
                    Rectangle()
                        .fill(Color("shadow"))
                        .opacity(0.4)
                        .frame(width: 50, height: 15)
                        .cornerRadius(50)
                        .scaleEffect(x:2, y: 1)
                        .offset(y: 35)
                    Rectangle()
                        .fill(Color("shadow"))
                        .opacity(0.4)
                        .frame(width: 50, height: 15)
                        .cornerRadius(50)
                        .offset(x: 0, y: 5)
                        .scaleEffect(x:2, y: 1)
                }
                // Item image
                item.image
                    .resizable()
                    .frame(width: 90, height: 100)
                    .offset(y: -10)
            }
            // Item's information
            VStack {
                Text(item.name)
                    .font(.custom("Raleway", size: 20))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.mainText)
                Spacer()
                    .frame(height: 10)
                HStack {
                    HStack {
                        Image(systemName: "wineglass")
                            .foregroundColor(.mainText)
                        Text("\(item.glass)")
                            .font(.custom("Raleway", size: 15))
                            .foregroundColor(.mainText)
                    }
                    Spacer()
                        .frame(width: 10)
                    HStack {
                        Image(systemName: "level")
                            .foregroundColor(.mainText)
                        Text("\(item.level)")
                            .font(.custom("Raleway", size: 15))
                            .foregroundColor(.mainText)
                    }
                }
            }
        }
    }
}



// Preview the content
struct ItemCard_Preview : PreviewProvider {
    static var previews: some View {
        ItemCard(item: items[0])
    }
}



