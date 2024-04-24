//
//  PeopleCoordinator.swift
//  BKSwifty
//
//  Created by Benjamin Kelsey on 4/20/24.
//

import SwiftUI

struct PeopleCoordinator: View {
    @Environment(PersistenceManager.self)
    var persistenceManager
    
    var body: some View {
        NavigationStack {
            PeopleView(viewModel: createViewModel())
        }
    }
    
    func createViewModel() -> PeopleView.ViewModel {
        .init(persistenceManager: persistenceManager)
    }
}
