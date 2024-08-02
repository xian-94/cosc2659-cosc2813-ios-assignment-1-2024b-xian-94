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

// TODO: Add real item object later
struct InstructionTab: View {
    var item: Item
    var body: some View {
        VStack {
            ZStack {
                UnevenRoundedRectangle(cornerRadii: .init(
                    topLeading: 50.0,
                    bottomLeading: 10.0,
                    bottomTrailing: 50.0,
                    topTrailing: 30.0),
                                       style: .continuous
                )
                .fill(Color("vintage-gold").opacity(0.4))
                .frame(width: 390, height: UIScreen.main.bounds.height *
                       (1/CGFloat(item.instruction.count) + 0.1))
                
                VStack {
                    Text("Steps")
                        .font(.custom("Playfair Display", size: 20))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(Array(item.instruction.enumerated()), id: \.offset) {
                            i, step in
                            HStack(spacing: 20) {
                                Text("\(i + 1)")
                                    .fontWeight(.medium)
                                Text("\(step)")
                            }
                            .padding(.horizontal)
                        }
                    }
                    .padding(.vertical, 4)
                }
            }
            
            Divider()
            VStack(alignment: .center) {
                Text("Video Guide")
                    .font(.custom("Playfair Display", size: 20))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                VideoView(videoID: "E-Tlb5x-QQg")
                    .frame(height: UIScreen.main.bounds.height * 0.3)
            }
            .padding(.vertical, 5)
        }
        .padding()
    }
}

struct InstructionTab_Preview: PreviewProvider {
    static var previews: some View {
        InstructionTab(item: items[0])
    }
}
