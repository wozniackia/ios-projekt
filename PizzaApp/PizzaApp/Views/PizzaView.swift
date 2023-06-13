//
//  PizzaView.swift
//  PizzaApp
//
//  Created by Antek Woźniacki on 17/05/2023.
//

import SwiftUI

struct PizzaView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Order.id, ascending: true)], animation: .default)
    
    private var orders: FetchedResults<Order>
    
    @State var pizzaSize = 1
    @Binding var viewIndex: Int
    
    var body: some View {
        VStack {
            PageHeader(headerText: "Skomponuj", textColor: .black, viewIndex: $viewIndex)
                .offset(y: 50)
            
            Spacer(minLength: 50)
            
            ZStack {
                Circle()
                    .fill(.blue.opacity(0))
                    .frame(width: 300)
                Circle()
                    .fill(Color.UI.pizza2)
                    .frame(width: pizzaSize == 1 ? 250 : 230)
                Circle()
                    .fill(Color.UI.pizza1)
                    .frame(width: pizzaSize == 1 ? 220 : 200)
            }
            Picker("What is your favorite color?", selection: $pizzaSize) {
                Text("Mała").tag(0)
                Text("Duża").tag(1)
            }
            .foregroundColor(.UI.orangePrimary)
            .pickerStyle(.segmented)
            
            List {
                ForEach(orders) {order in
                    Text("\(order.id?.uuidString ?? "nic")")
                }
            }
            
            Button("add") {
                addOrder()
            }
            
            BottomBar(index: viewIndex)
                .padding(0)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
        }
        .ignoresSafeArea()
    }
    
    private func addOrder() {
        let newOrder = Order(context: viewContext)
        newOrder.id = UUID()
        newOrder.orderDate = Date()
        newOrder.deliveryDate = Date().addingTimeInterval(30)
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}

struct PizzaView_Previews: PreviewProvider {
    static var previews: some View {
        PizzaView(viewIndex: .constant(1))
    }
}
