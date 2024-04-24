//
//  PersistenceManager.swift
//  BKSwifty
//
//  Created by Benjamin Kelsey on 4/23/24.
//

import CoreData
import Observation

@Observable
class PersistenceManager {
    let container: NSPersistentContainer

    init() {
        container = PersistenceManager.createContainer()
    }
}

private extension PersistenceManager {
    static func createContainer() -> NSPersistentContainer {
        let container = NSPersistentContainer(name: "Data")
        container.loadPersistentStores { (storeDescription, error) in
            if let error {
                fatalError(error.localizedDescription)
            }
        }
        return container
    }
}
