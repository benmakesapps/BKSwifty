//
//  NewPersonViewModel.swift
//  BKSwifty
//
//  Created by Benjamin Kelsey on 4/20/24.
//

import Observation

extension NewPersonView {
    @Observable
    class ViewModel {
        let persistenceManager: PersistenceManager
                
        init(persistenceManager: PersistenceManager) {
            self.persistenceManager = persistenceManager
        }
        
        func savePerson(_ name: String) throws {
            guard !name.isEmpty else {
                throw "Enter a name"
            }
            let person = try persistenceManager.newObject(ofType: Person.self)
            person.name = name
            try persistenceManager.save()
        }
    }
}
