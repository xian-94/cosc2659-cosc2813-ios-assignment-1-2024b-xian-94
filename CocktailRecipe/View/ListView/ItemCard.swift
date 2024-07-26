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
        ZStack {
            ZStack {
                Rectangle()
                    .fill(.gray)
                    .opacity(0.4)
                    .frame(width: 50, height: 20)
                    .cornerRadius(20)
                    .scaleEffect(x:2, y: 1)
                    .offset(x: -10, y: -15)
                Rectangle()
                    .fill(.gray)
                    .opacity(0.4)
                    .frame(width: 50, height: 20)
                    .cornerRadius(50)
                    .scaleEffect(x:2, y: 1)
                Rectangle()
                    .fill(.gray)
                    .opacity(0.4)
                    .frame(width: 50, height: 20)
                    .cornerRadius(50)
                    .offset(x: 10, y: 15)
                    .scaleEffect(x:2, y: 1)
            }
            VStack {
                item.image
                    .resizable()
                    .frame(width: 90, height: 100)
                    .offset(x: 0, y: -5)
                VStack {
                    Text(item.name)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .font(.system(size: 15))
                    Spacer()
                        .frame(height: 10)
                    HStack {
                        HStack {
                            Image(systemName: "clock")
                            Text("\(item.time) min")
                                .font(.system(size: 13))
                        }
                        Spacer()
                            .frame(width: 10)
                        HStack {
                            Image(systemName: "level")
                            Text("\(item.level)")
                                .font(.system(size: 13))
                        }
                    }
                }
                .offset()
               
                
            }
        }
        .padding(.all)
    }
}

// Preview the content
struct ItemCard_Preview : PreviewProvider {
    static var previews: some View {
        ItemCard(item: items[0])
    }
}



