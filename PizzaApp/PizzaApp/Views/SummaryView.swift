//
//  SummaryView.swift
//  PizzaApp
//
//  Created by Antek Woźniacki on 13/06/2023.
//

import SwiftUI

struct SummaryView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Order.orderDate, ascending: false)], animation: .default)
    
    private var orders: FetchedResults<Order>
    
    @Binding var viewIndex: Int
    @State var progress = 0.0
    
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()

    
    var body: some View {
        VStack {
            PageHeader(headerText: "Podsumowanie", showNextButton: false, textColor: .black, subTextColor: .UI.orangePrimary, lastPage: true, viewIndex: $viewIndex)
                .offset(y: 50)
            
            Spacer()
            
            ZStack {
                CircularProgressView(progress: $progress)
                    .frame(width: 250)
                VStack {
                    Text("Twoje zamówienie dotrze o:")
                        .font(.system(size: 15))
                        .foregroundColor(.UI.gray3)
                        .onReceive(timer) {_ in
                            progress = 1 - Date().distance(to: orders[0].deliveryDate!)/60
                            if (progress >= 1) {
                                progress = 1
                            }
                        }
                    Text(orders[0].deliveryDate!, style: .time)
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
