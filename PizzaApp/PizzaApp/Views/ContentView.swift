//
//  ContentView.swift
//  PizzaApp
//
//  Created by Antek Woźniacki on 17/05/2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @State var viewIndex = 0;
    @State var newOrder = Order()

    var body: some View {
    switch viewIndex {
    case 0:
        MainMenuView(viewIndex: $viewIndex)
    case 1:
        PizzaView(selected: [], viewIndex: $viewIndex)
    case 2:
        DeliveryView(viewIndex: $viewIndex)
    case 3:
        SummaryView(viewIndex: $viewIndex)
    default:
        MainMenuView(viewIndex: $viewIndex)
    }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
