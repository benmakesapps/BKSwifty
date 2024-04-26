//
//  NewPersonCoordinator.swift
//  BKSwifty
//
//  Created by Benjamin Kelsey on 4/20/24.
//

import SwiftUI

struct NewPersonCoordinator: View {
    @Environment(PersistenceManager.self)
    var persistenceManager
    
    @Environment(ErrorManager.self)
    var errorManager
    
    var body: some View {
        // 🤔
        @Bindable var errorManager = errorManager
        
        NewPersonView(viewModel: createViewModel())
            .alert(isPresented: $errorManager.showError) {
                Alert(title: Text(errorManager.message ?? "Error"))
            }
    }
    
    func createViewModel() -> NewPersonView.ViewModel {
        .init(persistenceManager: self.persistenceManager)
    }
}
