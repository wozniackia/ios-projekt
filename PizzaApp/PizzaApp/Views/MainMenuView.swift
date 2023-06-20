//
//  MainMenuView.swift
//  PizzaApp
//
//  Created by Antek Woźniacki on 17/05/2023.
//

import SwiftUI

struct MainMenuView: View {
    @Binding var viewIndex: Int
    
    var body: some View {
        VStack {
            PageHeader(headerText: "Menu", showBackButton: false, showNextButton: false, textColor: .white, viewIndex: $viewIndex)
                .offset(y: 50)
            
            Carousel()
                .foregroundColor(.white)
                .frame(height: 500)
            
            Button("Zamów pizzę") {
                viewIndex = 1
                print("Button pressed!")
            }
            .padding()
            .foregroundColor(.UI.orangePrimary)
            .background(.white)
            .clipShape(Capsule())
            
            Button("Informacje"){
                print("Wrobel")
            }
            .simultaneousGesture(LongPressGesture().onEnded{_ in
                    print("Wozniacki")
                })
            .foregroundColor(.UI.orangePrimary)
            .padding()
            .background(.white)
            .clipShape(Capsule())
            
            BottomBar(index: viewIndex)
                .offset(y:30)
                .padding(0)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
        }
        .ignoresSafeArea()
        .background(Color.UI.orangePrimary)
    }
}

struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView(viewIndex: .constant(0))
    }
}
