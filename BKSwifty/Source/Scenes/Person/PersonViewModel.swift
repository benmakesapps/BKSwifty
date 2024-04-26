//
//  PersonViewModel.swift
//  BKSwifty
//
//  Created by Benjamin Kelsey on 4/20/24.
//

import Observation

extension PersonView {
    @Observable
    class ViewModel {
        let person: Person
        let persistenceManager: PersistenceManager
        
        init(person: Person,
             persistenceManager: PersistenceManager) {
            self.person = person
            self.persistenceManager = persistenceManager
        }
        
        func updatePerson(with text: String) throws {
            guard !text.isEmpty else {
                throw "Name cannot be empty."
            }
            person.name = text
            try persistenceManager.save()
        }
    }
}
