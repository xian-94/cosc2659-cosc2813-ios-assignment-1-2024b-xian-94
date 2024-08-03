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

struct InstructionTab: View {
    var item: Item
    var body: some View {
        VStack(spacing: 20) {
            VStack {
                Text("Steps")
                    .font(.custom("Playfair Display", size: 20))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                VStack(alignment: .leading, spacing: 15) {
                    ForEach(Array(item.instruction.enumerated()), id: \.offset) {
                        i, step in
                        HStack(spacing: 20) {
                            Text("\(i + 1)")
                                .fontWeight(.medium)
                                .font(.custom("Raleway", size: 20))
                                .foregroundColor(Color("primary-text"))
                            Text("\(step)")
                                .font(.custom("Raleway", size: 16))
                                .foregroundColor(Color("main-text"))
                        }
                        .padding(.horizontal)
                        Divider()
                            .background(Color("accent"))
                    }
                }
                .padding(.vertical, 4)
            }
            
            VStack(alignment: .center) {
                Text("Tutorial")
                    .font(.custom("Playfair Display", size: 20))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                VideoView(item: item)
                    .frame(height: UIScreen.main.bounds.height * 0.3)
            }
            .padding(.vertical, 5)
        }
    }
}

struct InstructionTab_Preview: PreviewProvider {
    static var previews: some View {
        InstructionTab(item: items[0])
    }
}
