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
    
    @State var addingPerson: Bool = false
    
    var body: some View {
        NavigationStack {
            PeopleView(viewModel: createViewModel())
                .toolbar {
                    ToolbarItem {
                        Button(action: toggleSheet) {
                            Label("Add Person", systemImage: "plus")
                        }
                    }
                }
        }
        .sheet(isPresented: $addingPerson) {
            NewPersonCoordinator()
        }
    }
    
    func createViewModel() -> PeopleView.ViewModel {
        .init(persistenceManager: persistenceManager, 
              query: persistenceManager.query())
    }
}

private extension PeopleCoordinator {
    func toggleSheet() {
        addingPerson.toggle()
    }
}
