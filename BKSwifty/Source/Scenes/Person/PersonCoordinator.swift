//
//  PersonCoordinator.swift
//  BKSwifty
//
//  Created by Benjamin Kelsey on 4/20/24.
//

import SwiftUI

struct PersonCoordinator: View {
    @Environment(PersistenceManager.self)
    var persistenceManager
    
    let person: Person
    
    var body: some View {
        PersonView(viewModel: createViewModel())
    }
    
    func createViewModel() -> PersonView.ViewModel {
        .init(person: self.person,
        persistenceManager: persistenceManager)
    }
}
