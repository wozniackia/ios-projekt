//
//  aaaApp.swift
//  aaa
//
//  Created by Antek Woźniacki on 20/06/2023.
//

import SwiftUI

@main
struct aaaApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
