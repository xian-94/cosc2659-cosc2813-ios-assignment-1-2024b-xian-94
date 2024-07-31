/*
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

struct Tabs: View {
    var item: Item
    // Hold the selected tab index
    @State private var selected = 0
    let titles = ["Ingredients", "Instruction", "Shop"]
    
    var body: some View {
        VStack {
            HStack(spacing: 0) {
                ForEach(0..<titles.count, id: \.self) { i in
                    Text(titles[i])
                        .font(.system(size: 13))
                        .foregroundColor(self.selected == i ? .white : Color(.black).opacity(0.7))
                        .fontWeight(.bold)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 30)
                        .background(Color(.gray).opacity(self.selected == i ? 1 : 0))
                        .cornerRadius(10)
                        .onTapGesture {
                            withAnimation(.default) {
                                self.selected = i
                            }
                        }
                    Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                }
            }
            .background(Color.black.opacity(0.06))
            .cornerRadius(10)
            .padding(.horizontal)
            
            // Display tabs based on index chosen
            if self.selected == 0 {
                IngredientTab(item: item)
            }
            else if self.selected == 1 {
                InstructionTab(item: item)
            }
            else {
                InstructionTab(item: item)
            }
        }
    }
}

struct Tabs_Preview : PreviewProvider {
    static var previews: some View {
        Tabs(item: items[0])
    }
}
