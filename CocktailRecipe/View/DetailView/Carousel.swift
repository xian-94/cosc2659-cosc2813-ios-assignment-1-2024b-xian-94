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
 - Carousel tutorial: https://swiftspeedy.com/swiftui-carousel-effect-with-examples/
 
*/

import Foundation
import SwiftUI

// Carousel effect for a collection of image
struct Carousel: View {
    private let images = ["demo2", "demo2", "demo2"]
    // Add indicators
    @State private var currentIndex = 0
    var body: some View {
        // Horizontal scroll enables the effect
        ScrollView(.horizontal, showsIndicators: true) {
           
            HStack(spacing: 5) {
                DefaultImage(item: items[0])
                ForEach(images, id: \.self) {
                    imageName in
                    Image(imageName)
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width, height: 230)
                        .cornerRadius(10)
                }
            }
        }
        .padding(20)
    }
}

struct Carousel_Preview: PreviewProvider {
    static var previews: some View {
        Carousel()
    }
}


