//
//  PeopleViewModel.swift
//  BKSwifty
//
//  Created by Benjamin Kelsey on 4/20/24.
//

import Observation

extension PeopleView {
    @Observable
    class ViewModel {
        var persistenceManager: PersistenceManager
        var people: [String]
        
        init(persistenceManager: PersistenceManager,
             people: [String] = ["Ben", "Jessica", "Nora"]) {
            self.persistenceManager = persistenceManager
            self.people = people
        }
    }
}
