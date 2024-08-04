//
//  RatingPicker.swift
//  CocktailRecipe
//
//  Created by Do Le Long An on 4/8/24.
//

import Foundation
import SwiftUI

struct RatingPicker: View {
    @Binding var selectedRating: Int?
    
    var body: some View {
        HStack {
            ForEach(1..<6) {
                r in
                Text("\(r) ⭐")
                    .foregroundColor(Color.mainText)
                    .padding(.vertical, 10)
                    .frame(width: 70)
                    .background (selectedRating == r ? Color.shadow : Color.primary.opacity(0.06))
                    .contentShape(.rect)
                    .onTapGesture {
                        selectedRating = r
                    }
            }
        }
    }
}
