//
//  LevelPicker.swift
//  CocktailRecipe
//
//  Created by Do Le Long An on 4/8/24.
//

import Foundation
import SwiftUI

struct LevelPicker: View {
    @Binding var selectedLevel: String?
    @Namespace private var animation
    var body: some View {
        HStack {
            ForEach(["Easy", "Med", "Hard"], id: \.self) {
                level in
                Text(level)
                    .foregroundColor(Color.mainText)
                    .padding(.vertical, 10)
                    .frame(width: 100)
                    .background {
                        ZStack {
                            if selectedLevel?.lowercased() == level.lowercased() {
                                Capsule()
                                    .fill(Color("shadow"))
                                    .matchedGeometryEffect(id: "ACTIVETAB", in: animation)
                            }
                        }
                    }
                    .contentShape(.rect)
                    .onTapGesture {
                        selectedLevel = level
                    }
            }
        }
        .padding(3)
        .background(.primary.opacity(0.06), in: .capsule)
        .padding(.top, 20)
    }
}
