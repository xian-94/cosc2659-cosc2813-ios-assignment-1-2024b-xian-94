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



import SwiftUI

struct ContentView: View {
    // Change the app theme
    @State private var changeTheme: Bool = false
    @Environment(\.colorScheme) private var scheme: ColorScheme
//    @EnvironmentObject var themeManager: ThemeManager
    @AppStorage("user_theme") private var theme: Theme = .system
    var body: some View {
        NavigationView {
            VStack {
                ItemListView()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                                    Button(action: {
                                        // Present the ThemeManager
                                        changeTheme.toggle()
                                    }) {
                                        Image(systemName: "paintpalette")
                                    }
                                }
            }
        }
        .preferredColorScheme(theme.colorScheme)
        .sheet(isPresented: $changeTheme, content: {
            ThemeManagerView(scheme: scheme)
                .presentationDetents([.height( 410)])
                .presentationBackground(.clear)
        })
        
    }
}

#Preview {
    ContentView()
}
