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

struct WelcomeView: View {
    // Control the show popup information state
    @State private var showAlert = false
    
    var body: some View {
        ZStack {
            Color(.background)
                .ignoresSafeArea()
            // Logo
            VStack {
                Image("logo")
                Spacer()
                    .frame(height: 5)
                // Slogan
                Text("Where Every Sip \n Tells a Story")
                    .font(.custom("Lobster", size: 35))
                    .foregroundColor(.cranberry)
                    .multilineTextAlignment(.center)
                Spacer()
                    .frame(height: 20)
                // Navigation button
                NavigationLink(destination: ItemListView()) {
                    ZStack {
                        RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                            .fill(.cranberry)
                            .frame(width: 250, height: 50)
                        Text("Let's Explore")
                            .font(.custom("Playfair Display", size: 25))
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.background)
                    }
                       
                }
                // Information button
              
                    Spacer()
                    .frame(height: 30)
                    Button(action: {
                        showAlert.toggle()
                    }) {
                        Image(systemName: "info.circle.fill")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.vintageGold)
                    }
                    .offset(x: 150, y: 80)
                    .alert(isPresented: $showAlert, content: {
                        Alert(
                            title: Text("Author's information"),
                            message:
                                Text("Name: Truong Hong Van\nSID: 3957034\nProgram: BP162")
                           
                        )
                    })
            }
            .padding()
        }
    }
}

struct WelcomeView_Preview : PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
