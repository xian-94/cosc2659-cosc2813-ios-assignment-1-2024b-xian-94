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
 https://www.linkedi.com/pulse/why-behind-scenes-videos-popular-mark-harman/
 
 
 */

import Foundation
import SwiftUI

// Carousel effect for a collection of image
struct Carousel: View {
    private let images = ["demo2", "demo2", "demo2"]
    // Add indicators
    
    var body: some View {
        // Horizontal scroll enables the effect
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(images, id: \.self) {
                    imageName in
                    // Carousel effect using Geometry Reader
                    GeometryReader {
                        geometry in
                        Image(imageName)
                            .resizable()
                            .frame(width: 250, height: 300)
                            .cornerRadius(10)
                        // 3D effect when swiping 
                            .rotation3DEffect(Angle(degrees:
                            (Double(geometry.frame(in:.global).minX) - 100) / -20), axis: (x: 0.0, y: 10.0, z: 0.0)
                            )
                    }
                    .frame(width: 246, height: 300)
                }
            }
            .padding(50)

        }
        .frame(width: UIScreen.main.bounds.width, height: 400)
        
    }
}

struct Carousel_Preview: PreviewProvider {
    static var previews: some View {
        Carousel()
    }
}


