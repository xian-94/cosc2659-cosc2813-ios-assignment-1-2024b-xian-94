/*
 RMIT University Vietnam
 Course: COSC2659|COSC2813 iOS Development
 Semester: 2024B
 Assessment: Assignment 1
 Author: Truong Hong Van
 ID: 3957034
 Created  date: 20/7/2024
 Last modified: 04/08/2024
 Acknowledgement:
 Apple Developer (2024) NavigationLink, Apple Developer website, accessed 4 August 2024. https://developer.apple.com/documentation/swiftui/navigationlink
 Apple Developer (2024) Alert, Apple Developer website, accessed 4 August 2024.https://developer.apple.com/documentation/swiftui/alert
 Sofware Readers (2024) Navigation bar – A complete guide, Software Readers website, accessed 4 August 2024. https://softwareanders.com/swiftui-navigation-bar-a-complete-guide/
 Apple Developer (2024) Binding, Apple Developer website, accessed 4 August 2024. https://developer.apple.com/documentation/swiftui/binding
 Hudson P (2022) How to present a new view using sheet, Hacking with Swift website, accessed 4 August 2024. https://www.hackingwithswift.com/quick-start/swiftui/how-to-present-a-new-view-using-sheets
 Apple Developer (2024) LazyVGrid, Apple Developer website, accessed 4 August 2024.https://developer.apple.com/documentation/swiftui/lazyvgrid
 Ko J (13 January 2022) “Embed YouTube in SwiftUI”, Jacob’s Dev Blog¸ accessed 4 August 2024. https://jacobko.info/swiftui/swiftui-06/
 Apple Developer (2024) WKWebView, Apple Developer website, accessed 4 August 2024. https://developer.apple.com/documentation/webkit/wkwebview
 Apple Developer (2024) UIApplication, Apple Developer website, accessed 4 August 2024. https://developer.apple.com/documentation/uikit/uiapplication/1648685-open
 Apple Developer (2024) GeometryReader, Apple Developer website, accessed 4 August 2024. https://developer.apple.com/documentation/swiftui/geometryreader
 Google Fonts (2024) Raleway¸ Google Fonts website, accessed 4 August 2024. https://fonts.google.com/specimen/Raleway
 Google Fonts (2024) Playfair Display¸ Google Fonts website, accessed 4 August 2024. https://fonts.google.com/specimen/Playfair+Display
 Google Fonts (2024) Lobster¸ Google Fonts website, accessed 4 August 2024. https://fonts.google.com/specimen/Lobster
 Apple Developer (2024) AppStorage, Apple Developer website, accessed 4 August 2024. https://developer.apple.com/documentation/swiftui/appstorage
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
                        Text("\(item.base)")
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



