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
 - Customize shapes: https://www.appcoda.com/learnswiftui/swiftui-unevenroundedrectangle.html
*/

import Foundation
import SwiftUI

// Default image with custom shape and background for Drink detail
struct DefaultImage: View {
    // The image is the same as the one in the catalog view
    var item: Item
    var body: some View {
        ZStack {
            // Custom background for the image
            UnevenRoundedRectangle(
                topLeadingRadius: 100,
                bottomLeadingRadius: 0,
                bottomTrailingRadius: 0,
                topTrailingRadius: 100,
                style: .continuous
                
                                   
            )
            .foregroundStyle(.gray)
            .opacity(0.4)
            .frame(width: 300, height: 200)
            .padding()
            item.image
                .resizable()
                .offset(x: 0, y: -50)
                .frame(width: 200, height: 270)
        }
        .padding(20)
    }
}

struct DefaultImage_Preview: PreviewProvider {
    static var previews: some View {
        DefaultImage(item: items[0])
    }
}
