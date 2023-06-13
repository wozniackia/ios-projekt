//
//  DeliveryView.swift
//  PizzaApp
//
//  Created by gelo on 13/06/2023.
//

import SwiftUI

struct DeliveryView: View {
    @State var Ulica :String = ""
    @State var Kod :String = ""
    @State var Miasto :String = ""
    @State var Telefon :String = ""
    @Binding var viewIndex: Int
    
    var body: some View {
            VStack {
                PageHeader(headerText: "Dostawa", showNextButton: false, textColor: Color.black, subTextColor: Color.UI.orangePrimary, viewIndex: $viewIndex)
                    .offset(y: 50)
                
                Spacer(minLength: 75)
                
                TextField("Ulica i numer",text: $Ulica)
                    .frame(width: 330,height: 50)
                    .border(Color.UI.gray2)
                    .cornerRadius(8)
                    .background(Color.UI.gray1)
                TextField("Kod pocztowy",text: $Kod)
                    .frame(width: 330,height: 50)
                    .border(Color.UI.gray2)
                    .cornerRadius(8)
                    .background(Color.UI.gray1)
                TextField("Miasto",text: $Miasto)
                    .frame(width: 330,height: 50)
                    .border(Color.UI.gray2)
                    .cornerRadius(8)
                    .background(Color.UI.gray1);
                TextField("Numer telefonu",text: $Telefon)
                    .frame(width: 330,height: 50)
                    .border(Color.UI.gray2)
                    .cornerRadius(8)
                    .background(Color.UI.gray1);
                
                Spacer(minLength: 50)
                
                Button("Zamów pizzę") {
                    viewIndex += 1
                }
                .padding()
                .foregroundColor(Color.white)
                .background(Color.UI.orangePrimary)
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
