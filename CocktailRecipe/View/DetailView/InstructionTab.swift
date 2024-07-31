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
        VStack(alignment: .leading) {
            ForEach(Array(item.instruction.enumerated()), id: \.offset) {
                i, step in
                HStack {
                    Text("\(i + 1)")
                        .fontWeight(.medium)
                    Spacer()
                        .frame(width: 30)
                    Text("\(step)")
                }
            }
            .padding(.vertical, 4)
            Divider()
            VStack(alignment: .center) {
                Text("Video Guide")
                    .font(.headline)
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
