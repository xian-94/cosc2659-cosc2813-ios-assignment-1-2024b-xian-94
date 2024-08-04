/*
 Course: COSC2659|COSC2813 iOS Development
 Semester: 2024B
 Assessment: Assignment 1
 Author: Truong Hong Van
 ID: 3957034
 Created  date: 20/7/2024
 Last modified:
 Acknowledgement:
 - https://www.swiftyplace.com/blog/mastering-swiftui-buttons-a-comprehensive-guide-to-creating-and-customizing-buttons */

import Foundation
import SwiftUI
import MapKit

struct MapView: View {
    
    var location: Location
    // Control the pop up information box
    @State private var popup = false
    // Main body view
    var body: some View {
        ZStack {
            Map(initialPosition: .region(
                MKCoordinateRegion(
                    center: location.coordinate,
                    span: MKCoordinateSpan(latitudeDelta: 0.004, longitudeDelta: 0.004)
                )))
            {
                // Set marker for the location
                Annotation(location.name, coordinate: location.coordinate) {
                    VStack {
                        Image(systemName: "mappin.circle.fill")
                            .foregroundColor(Color("cranberry"))
                            .controlSize(.extraLarge)
                            .onTapGesture {
                                popup.toggle()
                            }
                    }
                }
            }
            if popup {
                // Background color to make the popup box outstanding
                Color("shadow").opacity(0.4)
                    .ignoresSafeArea()
                // Pop up information box
                ZStack {
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                        .fill(Color("background"))
                        .frame(width: 300, height: 200)
                    // Show detailed information of the location
                    VStack(spacing: 30) {
                        Text(location.name)
                            .foregroundColor(Color("main-text"))
                            .font(.custom("Playfair Display", size: 20))
                            .fontWeight(.bold)
                        Text(location.address)
                            .foregroundColor(Color("main-text"))
                            .font(.custom("Raleway", size: 15))
                            .padding(.horizontal, 50)
                        // Button to close the popup
                        Button(action: {
                            popup.toggle()
                        }, label: {
                            Text("OK")
                                .foregroundColor(Color("main-text"))
                                .font(.custom("Raleway", size: 18))
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            
                            
                        })
                        .cornerRadius(20)
                        .controlSize(.large)
                        .buttonBorderShape(.capsule)
                        .buttonStyle(.borderedProminent)
                        .tint(Color("vintage-gold").opacity(0.4))
                    }
                }
            }
        }
    }
}

struct MapView_Preview: PreviewProvider {
    static var previews: some View {
        MapView(location: items[0].location)
    }
}
