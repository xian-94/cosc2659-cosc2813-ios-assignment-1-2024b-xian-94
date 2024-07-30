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

// Merge all the component view into the main Detail view
struct ItemDetailView : View  {
    var item: Item
    
    var body: some View {
        ScrollView {
            VStack {
                Carousel()
                Description(item: item)
                Tabs()
            }
            .padding()
        }
    }
}

// Preview the content
struct ItemDetailView_Preview : PreviewProvider {
    static var previews: some View {
        ItemDetailView(item: items[0])
    }
}


