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
    private let instruction: [String] = [
        "Muddle mint leaves and sugar in a glass.",
        "Add lime juice and rum.",
        "Fill the glass with ice and top with soda water.",
        "Stir gently and garnish with mint."
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(Array(instruction.enumerated()), id: \.offset) {
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
        }
        .padding()
    }
}

struct InstructionTab_Preview: PreviewProvider {
    static var previews: some View {
        InstructionTab()
    }
}
