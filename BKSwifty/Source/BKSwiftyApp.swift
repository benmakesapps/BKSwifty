//
//  BKSwiftyApp.swift
//  BKSwifty
//
//  Created by Benjamin Kelsey on 4/22/24.
//

import SwiftUI

@main

struct BKSwiftyApp: App {
    let persistenceManager = PersistenceManager()
    @State var errorManager = ErrorManager()
    
    var body: some Scene {
        WindowGroup {
            PeopleCoordinator()
                .environment(persistenceManager)
                .environment(errorManager)
                .alert(isPresented: $errorManager.showError) {
                    Alert(title: Text(errorManager.message ?? "Error"))
                }
        }
    }
}
