//
//  DeliveryView.swift
//  PizzaApp
//
//  Created by gelo on 13/06/2023.
//

import SwiftUI

struct DeliveryView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Order.orderDate, ascending: false)], animation: .default)
    
    private var orders: FetchedResults<Order>
    
    @Binding var viewIndex: Int
    
    @State private var street = ""
    @State private var postalCode = ""
    @State private var city = ""
    @State private var phoneNumber = ""
    
    var isDeliveryDataValid: Bool {
        return !street.isEmpty && !postalCode.isEmpty && !city.isEmpty && !phoneNumber.isEmpty && phoneNumber.count == 9
    }
    
    var body: some View {
            VStack {
                PageHeader(headerText: "Dostawa", showNextButton: false, textColor: Color.black, subTextColor: Color.UI.orangePrimary, viewIndex: $viewIndex)
                    .offset(y: 50)
                
                Spacer(minLength: 75)
                
                TextField("Ulica i numer",text: $street)
                    .frame(width: 330,height: 50)
                    .border(Color.UI.gray2)
                    .cornerRadius(8)
                    .background(Color.UI.gray1)
                TextField("Kod pocztowy",text: $postalCode)
                    .frame(width: 330,height: 50)
                    .border(Color.UI.gray2)
                    .cornerRadius(8)
                    .background(Color.UI.gray1)
                TextField("Miasto",text: $city)
                    .frame(width: 330,height: 50)
                    .border(Color.UI.gray2)
                    .cornerRadius(8)
                    .background(Color.UI.gray1);
                TextField("Numer telefonu",text: $phoneNumber)
                    .frame(width: 330,height: 50)
                    .border(Color.UI.gray2)
                    .cornerRadius(8)
                    .background(Color.UI.gray1);
                
                Spacer(minLength: 50)
                
                Button("Zamów pizzę") {
                    orders[0].deliveryDate = Date().addingTimeInterval(60)
                    do {
                        try viewContext.save()
                    } catch {
                        let nsError = error as NSError
                        fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                    }
                    viewIndex += 1
                }
                .disabled(!isDeliveryDataValid)
                .padding()
                .foregroundColor(isDeliveryDataValid ? Color.white : .UI.gray4)
                .background(isDeliveryDataValid ? Color.UI.orangePrimary : .UI.gray1)
                .clipShape(Capsule())
                .position(x: 195, y: 25)
                
                
                BottomBar(index: viewIndex)
            }
            .ignoresSafeArea()
            .background(.white)}
    
}
struct DeliveryView_Previews: PreviewProvider {
    static var previews: some View {
        DeliveryView(viewIndex: .constant(2))
    }
}
