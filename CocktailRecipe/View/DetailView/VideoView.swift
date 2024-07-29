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
 - Embed Video: https://www.typesafely.co.uk/p/create-a-swiftui-youtube-player
 */

import Foundation
import WebKit
import SwiftUI

// Placeholder for Instruction Video
// Embed YouTube video in the main view
// TODO: Add video ID to the Item details
struct VideoView: UIViewRepresentable {
    let videoID: String
    
    // Create a WKWebView instance
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    // Update the view when the URL changes
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let url = URL(string: "https://www.youtube.com/embed/\(videoID)") else {return}
        uiView.scrollView.isScrollEnabled = false
        // Create the URL request and load in the web view
        uiView.load(URLRequest(url: url))
    }
}


