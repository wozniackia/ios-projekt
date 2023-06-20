//
//  CheckboxRow.swift
//  Pizzeria_KWierzbowski_AWojcik
//
//  Created by Antek Woźniacki on 20/06/2023.
//

import SwiftUI

struct CheckboxRow: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Text(title)
                Spacer()
                Image(systemName: isSelected ? "checkmark.square.fill" : "square")
            }
        }
    }
}
struct CheckboxRow_Previews: PreviewProvider {
    static var previews: some View {
        CheckboxRow(title: "SER", isSelected: true, action: {})
    }
}
