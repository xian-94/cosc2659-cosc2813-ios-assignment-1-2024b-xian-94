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

struct Tabs: View {
    var item: Item
    // Hold the selected tab index
    @State private var selected = 0
    let titles = ["Ingredients", "Instruction", "Shop"]
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 0) {
                // Loop through each title for display
                ForEach(0..<titles.count, id: \.self) { i in
                    Text(titles[i])
                        .font(.custom("Playfair Display", size: 12))
                    // Selected title has a different color
                        .foregroundColor(self.selected == i ? Color(.white) : Color("main-text"))
                        .fontWeight(.bold)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 30)
                    // Selected title has an oustanding background
                        .background(Color("cranberry").opacity(self.selected == i ? 1 : 0))
                        .cornerRadius(10)
                        .onTapGesture {
                            withAnimation(.default) {
                                self.selected = i
                            }
                        }
                    Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                }
            }
            .background(Color("cranberry").opacity(0.4))
            .cornerRadius(10)
            .padding(.horizontal)
            .frame(width: 380)
            
            // Display tabs based on index chosen
            if self.selected == 0 {
                IngredientTab(item: item)
            }
            else if self.selected == 1 {
                InstructionTab(item: item)
            }
            else {
                ShopTab(item: item)
                   
            }
        }
    }
}

struct Tabs_Preview : PreviewProvider {
    static var previews: some View {
        Tabs(item: items[0])
    }
}
