//
//  BottomBar.swift
//  PizzaApp
//
//  Created by Antek Woźniacki on 17/05/2023.
//

import SwiftUI

struct BottomBar: View {
    var index = 0
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: .infinity, height: 83)
                .foregroundColor(.UI.gray1)
            HStack(spacing: 40) {
                ForEach((0..<4), id: \.self) { index in
                    if(index == self.index) {
                        Circle()
                            .frame(width: 32, height: 32)
                            .foregroundColor(.UI.orangePrimary)
                    } else {
                        Circle()
                            .frame(width: 32, height: 32)
                            .foregroundColor(.UI.gray2)
                    }
                }
            }
        }
        .padding(0)
    }
}

struct BottomBar_Previews: PreviewProvider {
    static var previews: some View {
        var index = 0
        BottomBar(index: index)
    }
}
