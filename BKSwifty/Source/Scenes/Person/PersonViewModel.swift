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
        let person: String
        
        init(person: String) {
            self.person = person
        }
    }
}
