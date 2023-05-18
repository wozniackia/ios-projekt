//
//  Carousel.swift
//  PizzaApp
//
//  Created by Antek Woźniacki on 17/05/2023.
//

import SwiftUI

struct Carousel: View {
    @State private var index = 0
    
    var images = [
        "pizza1",
        "pizza2",
        "pizza3"
    ]
    var headers = [
        "Jakość",
        "Autentyczność",
        "Pizza!"
    ]
    var descriptions = [
        "Witamy w naszej pizzerni, gdzie smak i jakość są naszym priorytetem! Oferujemy szeroki wybór pysznych pizz, przygotowywanych z najświeższych składników i pieczonych w tradycyjnym piecu na drewno.",
        "Wszystkie nasze pizze są przygotowywane na miejscu przez naszych doświadczonych kucharzy z pasją i starannością.",
        "Zamów i doświadcz prawdziwej pizzowej rozkoszy w naszej pizzerni!"
    ]
    
    var body: some View {
        VStack{
            TabView(selection: $index) {
                ForEach((0..<3), id: \.self) { index in
                    CardView(image: images[index], header: headers[index], description: descriptions[index])
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        }
    }
}

struct Carousel_Previews: PreviewProvider {
    static var previews: some View {
        Carousel()
    }
}

struct CardView: View{
    var image = "pizza1"
    var header = "Jakość"
    var description = "Witamy w naszej pizzerni, gdzie smak i jakość są naszym priorytetem! Oferujemy szeroki wybór pysznych pizz, przygotowywanych z najświeższych składników i pieczonych w tradycyjnym piecu na drewno."
    
    var body: some View{
        VStack(alignment: .leading) {
            Image(image)
                .resizable()
                .frame(width: 343, height: 240)
                .cornerRadius(10)
                .cornerRadius(10)
            Text(header)
            VStack(alignment: .center) {
                Text(description)
                    .padding(.top, 8)
            }
        }
        .padding()
    }
}
