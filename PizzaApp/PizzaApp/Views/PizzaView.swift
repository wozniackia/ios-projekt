//
//  PizzaView.swift
//  PizzaApp
//
//  Created by Antek Woźniacki on 17/05/2023.
//

import SwiftUI

struct PizzaView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Order.orderDate, ascending: false)], animation: .default)
    
    private var orders: FetchedResults<Order>
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Topping.name, ascending: false)], animation: .default)
    
    private var toppings: FetchedResults<Topping>
    
    @State var pizzaSize = 1
    @State var selected: [String]
    @Binding var viewIndex: Int
    
    var isPizzaDataValid: Bool {
        return selected.count > 0
    }
    
    func addTopping(name: String) {
        let newTopping = Topping(context: viewContext)
        newTopping.name = name
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    var body: some View {
        VStack {
            PageHeader(headerText: "Skomponuj", showNextButton: false, textColor: .black, subTextColor: .UI.orangePrimary ,viewIndex: $viewIndex)
                .offset(y: 50)
            
            Spacer(minLength: 50)
            
            ZStack {
                Circle()
                    .fill(.blue.opacity(0))
                    .frame(width: 300)
                Circle()
                    .fill(Color.UI.pizza2.opacity(0))
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
                ForEach(toppings) {
                    topping in
                    CheckboxRow(title: topping.name!, isSelected: selected.contains(topping.name!)) {
                        if selected.contains(topping.name!) {
                            selected.removeAll(where: { $0 == topping.name! })
                        } else {
                            selected.append(topping.name!)
                        }
                    }
                }
            }
            .foregroundColor(.UI.orangePrimary)
            
            Spacer(minLength: 50)
            
            Button("Zamów pizzę") {
                let newOrder = Order(context: viewContext)
                newOrder.id = UUID()
                newOrder.orderDate = Date()
                newOrder.deliveryDate = Date().addingTimeInterval(60)
                newOrder.size = NSNumber.init(value: pizzaSize)
                do {
                    try viewContext.save()
                } catch {
                    let nsError = error as NSError
                    fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                }
                viewIndex += 1
            }
            .disabled(!isPizzaDataValid)
            .padding()
            .foregroundColor(isPizzaDataValid ? Color.white : .UI.gray4)
            .background(isPizzaDataValid ? Color.UI.orangePrimary : .UI.gray1)
            .clipShape(Capsule())
            BottomBar(index: viewIndex)
                .padding(0)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
        }
        .ignoresSafeArea()
        .onAppear {
            if (toppings.count == 0) {
                addTopping(name: "Cebula")
                addTopping(name: "Pieczarki")
                addTopping(name: "Oliwki")
                addTopping(name: "Kukurydza")
                addTopping(name: "Kurczak")
                addTopping(name: "Salami")
                addTopping(name: "Boczek")
            }
        }
    }
    
}

struct PizzaView_Previews: PreviewProvider {
    static var previews: some View {
        PizzaView(selected: [], viewIndex: .constant(1))
    }
}
