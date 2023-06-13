//
//  SummaryView.swift
//  PizzaApp
//
//  Created by Antek Woźniacki on 13/06/2023.
//

import SwiftUI

struct SummaryView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
       sortDescriptors: [NSSortDescriptor(keyPath: \Order.id,
    ascending: true)],
    animation: .default)

     private var order: FetchedResults<Order>
    
    @Binding var viewIndex: Int
    @State var progress = 0.7
    
    var body: some View {
        VStack {
            PageHeader(headerText: "Podsumowanie", showNextButton: false, textColor: .black, subTextColor: .UI.orangePrimary, viewIndex: $viewIndex)
                .offset(y: 50)
            
            Spacer()
            
            ZStack {
                CircularProgressView(progress: $progress)
                    .frame(width: 250)
                VStack {
                    Text("Twoje zamówienie dotrze o:")
                        .font(.system(size: 15))
                        .foregroundColor(.UI.gray3)
                    Text("17:03")
                        .font(.system(size: 35))
                        .foregroundColor(.UI.orangePrimary)
                    Text("\(Int(progress*100))%")
                        .font(.system(size: 15))
                        .foregroundColor(.UI.gray3)
                }
            }
            
            Spacer()
            
            Image("pizzaDrawing")
                .resizable()
                .frame(width: 180, height: 180)
            
            Spacer()
            
            BottomBar(index: viewIndex)
        }
        .ignoresSafeArea()
        
    }
}

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView(viewIndex: .constant(3))
    }
}
