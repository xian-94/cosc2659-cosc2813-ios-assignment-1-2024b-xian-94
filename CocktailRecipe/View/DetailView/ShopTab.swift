/*
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

struct ShopTab: View {
    
    // Open social media url
    private func openURL(url: String) {
        if let url = URL(string: url) {
            UIApplication.shared.open(url)
        }
    }
    var item: Item
    var body: some View {
        VStack(alignment: .center) {
            Text("Shop Online")
                .font(.custom("Playfair Display", size: 20))
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .foregroundStyle(Color.mainText)
            Divider()
                .frame(width: 200)
                .background(Color("primary-text"))
            // Social icons
            HStack(spacing: 10) {
                Button(action: {
                    openURL(url: item.location.facebook)
                }) {
                    Image("facebook")
                        .resizable()
                        .frame(width: 50, height: 50)
                }
                Button(action: {
                    openURL(url: item.location.shoppee)
                }) {
                    Image("shopee")
                        .resizable()
                        .frame(width: 100, height: 100)
                }
            }
            
            Divider()
                .frame(width: 200)
                .background(Color("primary-text"))
            // Map Display
            Text("Visit Store")
                .font(.custom("Playfair Display", size: 20))
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .foregroundStyle(Color.mainText)
           
            MapView(location: item.location)
                .frame(height: UIScreen.main.bounds.height * 0.5)
            
        }
       
        
    }
       
}

struct ShopTab_Preview : PreviewProvider {
    static var previews: some View {
        ShopTab(item: items[0])
    }
}
