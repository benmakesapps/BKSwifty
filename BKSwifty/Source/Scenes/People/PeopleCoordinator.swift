//
//  PeopleCoordinator.swift
//  CoreDataObservable
//
//  Created by Benjamin Kelsey on 4/20/24.
//

import SwiftUI

struct PeopleCoordinator: View {
    var body: some View {
        NavigationStack {
            PeopleView(viewModel: createViewModel())
        }
    }
    
    func createViewModel() -> PeopleView.ViewModel {
        .init()
    }
}
