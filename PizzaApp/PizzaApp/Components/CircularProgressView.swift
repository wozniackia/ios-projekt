//
//  CircularProgressView.swift
//  PizzaApp
//
//  Created by Antek Woźniacki on 13/06/2023.
//

import SwiftUI

struct CircularProgressView: View {
    
    @Binding var progress: Double
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(
                    Color.UI.gray2,
                    lineWidth: 10
                )
            Circle()
                .trim(from: 0, to: progress)
                .stroke(
                    Color.UI.orangePrimary,
                    lineWidth: 10
                )
                .rotationEffect(.degrees(-90))
                .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))

        }
    }
}

struct CircularProgressView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProgressView(progress: .constant(0.9))
    }
}
