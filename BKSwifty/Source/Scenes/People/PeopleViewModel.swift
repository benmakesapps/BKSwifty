//
//  PeopleViewModel.swift
//  CoreDataObservable
//
//  Created by Benjamin Kelsey on 4/20/24.
//

import Observation

extension PeopleView {
    @Observable
    class ViewModel {
        var people: [String]
        
        init(people: [String] = ["Ben", "Jessica", "Nora"]) {
            self.people = people
        }
    }
}
