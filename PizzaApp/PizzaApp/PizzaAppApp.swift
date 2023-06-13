//
//  PizzaAppApp.swift
//  PizzaApp
//
//  Created by Antek Woźniacki on 17/05/2023.
//

import SwiftUI
import CoreData

@main
struct PizzaAppApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

extension Color {
    struct UI {
        static let orangePrimary = Color("OrangePrimary")
        static let orangeSecondary = Color("OrangeSecondary")
        static let gray1 = Color("Gray01")
        static let gray2 = Color("Gray02")
        static let gray3 = Color("Gray03")
        static let gray4 = Color("Gray04")
        static let pizza1 = Color("Pizza01")
        static let pizza2 = Color("Pizza02")
    }
}
