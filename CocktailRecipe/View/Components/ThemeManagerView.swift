/*
 RMIT University Vietnam
 Course: COSC2659|COSC2813 iOS Development
 Semester: 2024B
 Assessment: Assignment 1
 Author: Truong Hong Van
 ID: 3957034
 Created  date: 20/7/2024
 Last modified:
 Acknowledgement:
 - Form: https://developer.apple.com/documentation/swiftui/form
 - Picker: https://developer.apple.com/documentation/swiftui/picker
 - Sheet: https://developer.apple.com/documentation/swiftui/view/sheet(ispresented:ondismiss:content:)
 */

import SwiftUI

// Create a sheet for change light/dark mode
struct ThemeManagerView: View {
    var scheme: ColorScheme
//    @EnvironmentObject var themeManager: ThemeManager
    @AppStorage("user_theme") private var theme: Theme = .system
    // Sliding effect
    @Namespace private var animation
    // Main view
    var body: some View {
        VStack(spacing: 15) {
            Circle()
                .fill(theme.color(scheme).gradient)
                .frame(width: 150, height: 150)
            Text("Choose a theme")
                .font(.custom("Raleway", size: 25))
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .padding(.top, 25)
            
            // Theme picker
            HStack {
                ForEach(Theme.allCases, id: \.rawValue) {
                    th in
                    Text(th.rawValue)
                        .padding(.vertical, 10)
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                        .background {
                            ZStack {
                                if theme == th {
                                    Capsule()
                                        .fill(Color("background"))
                                        .matchedGeometryEffect(id: "ACTIVE", in: animation)
                                }
                            }
                            .animation(.snappy, value: theme)
                        }
                        .contentShape(.rect)
                        .onTapGesture {
                            theme = th
                        }
                }
            }
            .padding(3)
            .background(.primary.opacity(0.06), in: .capsule)
            .padding(.top, 20)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .frame(height: 410)
        .background(Color("background"))
        .clipShape(.rect(cornerRadius: 30))
        .padding(.horizontal, 15)
        .environment(\.colorScheme, scheme)
    }
}


// Control theme by case
enum Theme: String, CaseIterable {
    case system =  "System"
    case light = "Light"
    case dark = "Dark"
    
    // Display the circle color
    func color(_ scheme: ColorScheme) -> Color {
        switch self {
        case .system:
            return scheme == .dark ? .accent : .vintageGold
        case .light:
            return .vintageGold
        case .dark:
            return .accent
        }
    }
    // Adjust color scheme 
    var colorScheme: ColorScheme? {
        switch self {
        case .system:
            return nil
        case .light:
            return .light
        case .dark:
            return .dark
        }
    }
}


