//
//  MainMenuView.swift
//  PizzaApp
//
//  Created by Antek Woźniacki on 17/05/2023.
//

import SwiftUI

struct MainMenuView: View {
    var body: some View {
        VStack {
            PageHeader(headerText: "Menu", showBackButton: false, showNextButton: false, textColor: .white)
            Carousel()
                .foregroundColor(.white)
                .position(x: 195, y: 210)
                .frame(height: 500)
            Button("Zamów pizzę") {
                print("Button pressed!")
            }
            .padding()
            .foregroundColor(.UI.orangePrimary)
            .background(.white)
            .clipShape(Capsule())
            .position(x: 195, y: 25)
            BottomBar(index:0)
                .position(x: 195, y: 80)
        }
        .background(Color.UI.orangePrimary)
    }
}

struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
    }
}
