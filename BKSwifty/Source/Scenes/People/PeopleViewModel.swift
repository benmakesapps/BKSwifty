//
//  PeopleViewModel.swift
//  BKSwifty
//
//  Created by Benjamin Kelsey on 4/20/24.
//

import Observation
import Foundation

extension PeopleView {
    @Observable
    class ViewModel {
        var persistenceManager: PersistenceManager
        var query: Query<Person>
        var sortAscending: Bool = true
        
        var sortIcon: String {
            switch sortAscending {
            case true: "arrowtriangle.up.fill"
            case false: "arrowtriangle.down.fill"
            }
        }
        
        init(persistenceManager: PersistenceManager,
             query: Query<Person>) {
            self.persistenceManager = persistenceManager
            self.query = query
        }
        
        func onViewDidLoad() throws {
            try query.sort(by: \Person.name, ascending: sortAscending)
        }
        
        func delete(at indices: IndexSet) throws {
            try indices.forEach { index in
                try persistenceManager.delete(query.items[index], save: false)
            }
            try persistenceManager.save()
        }
        
        func toggleSortOrder() throws {
            sortAscending.toggle()
            try query.sort(by: \Person.name, ascending: sortAscending)
        }
        
        func filter(including substring: String) throws {
            let predicate = substring.isEmpty ? nil : Predicate<Person>().containsSubstring(\.name, substring)
            try query.filter(by: predicate)
        }
    }
}
