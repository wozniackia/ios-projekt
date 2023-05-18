//
//  PizzaView.swift
//  PizzaApp
//
//  Created by Antek Woźniacki on 17/05/2023.
//

import SwiftUI

struct PizzaView: View {
    init() {
        UISegmentedControl.appearance().backgroundColor = UIColor(.UI.gray2)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(.UI.orangePrimary)], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(.UI.gray3)], for: .normal)
    }
    
    @State var pizzaSize = 1
    
    var body: some View {
        VStack {
            PageHeader(headerText: "Skomponuj", textColor: .black)
            Circle()
                .frame(width: 196)
            Picker("What is your favorite color?", selection: $pizzaSize) {
                Text("Mała").tag(0)
                Text("Duża").tag(1)
            }
            .foregroundColor(.UI.orangePrimary)
            .pickerStyle(.segmented)
            BottomBar(index: 1)
        }
    }
}

struct PizzaView_Previews: PreviewProvider {
    static var previews: some View {
        PizzaView()
    }
}
