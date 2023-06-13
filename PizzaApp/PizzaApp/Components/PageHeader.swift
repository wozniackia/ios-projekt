//
//  PageHeader.swift
//  PizzaApp
//
//  Created by Antek Woźniacki on 17/05/2023.
//

import SwiftUI

struct PageHeader: View {
    
    var headerText: String
    var showBackButton = true
    var showNextButton = true
    var textColor = Color.UI.orangePrimary
    var subTextColor = Color.black
    
    @Binding var viewIndex: Int
    
    var body: some View {
        HStack {
            if showBackButton {
                VStack {
                    Button("Powrót") {
                        viewIndex = viewIndex-1
                    }
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(subTextColor)
                }
            } else {
                Rectangle()
                    .frame(width: 50, height: 20)
                    .foregroundColor(.white.opacity(0))
            }
            Spacer()
            Text(headerText)
                .font(.system(size: 30, weight: .semibold))
                .foregroundColor(textColor)
            Spacer()
            if showNextButton {
                Button("Dalej") {
                    viewIndex = viewIndex+1
                }
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(subTextColor)
            } else {
                Rectangle()
                    .frame(width: 50, height: 20)
                    .foregroundColor(.white.opacity(0))
            }
        }
        .padding(.all, 16)
    }
}

struct PageHeader_Previews: PreviewProvider {
    static let headerText = "Menu"
    static let showBackButton = true
    static let showNextButton = true
    static let textColor = Color.UI.orangePrimary
    static let subTextColor = Color.black
    static var previews: some View {
        PageHeader(headerText: headerText, showBackButton: showBackButton, showNextButton: showNextButton, textColor: textColor, subTextColor: subTextColor, viewIndex: .constant(0))
    }
}
