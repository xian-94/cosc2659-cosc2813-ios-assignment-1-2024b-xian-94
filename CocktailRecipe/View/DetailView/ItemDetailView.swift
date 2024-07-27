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
struct ItemDetailView : View  {
    var item: Item
    
    var body: some View {
        ZStack {
            ZStack {
                Rectangle()
                    .fill(.brown)
                    .frame(width: 100, height: 30)
                    .cornerRadius(20)
                    .scaleEffect(x:2, y: 1)
                    .offset(x: -30, y: -20)
                Rectangle()
                    .fill(.brown)
                    .frame(width: 100, height: 30)
                    .cornerRadius(50)
                    .scaleEffect(x:2, y: 1)
                Rectangle()
                    .fill(.brown)
                    .frame(width: 100, height: 30)
                    .cornerRadius(50)
                    .offset(x: 20, y: 20)
                    .scaleEffect(x:2, y: 1)
            }
            HStack {
                VStack {
                    Text(item.name)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
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
                .offset(x: 30, y: -70)
                item.image

                    .offset(x: 0, y: -60)
                
            }
        }
        .padding()
    }
}

// Preview the content
struct ItemDetailView_Preview : PreviewProvider {
    static var previews: some View {
        ItemDetailView(item: items[0])
    }
}


