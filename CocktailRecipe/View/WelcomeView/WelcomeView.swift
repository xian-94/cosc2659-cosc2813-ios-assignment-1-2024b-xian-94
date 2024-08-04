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
