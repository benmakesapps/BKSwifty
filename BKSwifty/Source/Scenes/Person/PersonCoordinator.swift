//
//  PersonCoordinator.swift
//  BKSwifty
//
//  Created by Benjamin Kelsey on 4/20/24.
//

import SwiftUI

struct PersonCoordinator: View {
    let person: String
    
    var body: some View {
        PersonView(viewModel: createViewModel())
    }
    
    func createViewModel() -> PersonView.ViewModel {
        .init(person: self.person)
    }
}
