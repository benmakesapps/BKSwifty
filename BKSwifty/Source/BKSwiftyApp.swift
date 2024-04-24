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
    
    var body: some Scene {
        WindowGroup {
            PeopleCoordinator()
                .environment(persistenceManager)
        }
    }
}
