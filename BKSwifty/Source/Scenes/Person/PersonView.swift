//
//  PersonView.swift
//  CoreDataObservable
//
//  Created by Benjamin Kelsey on 4/20/24.
//

import SwiftUI

struct PersonView: View {
    @State var viewModel: ViewModel
    
    var body: some View {
        Text(viewModel.person)
    }
}

#Preview {
    PersonView(viewModel: PersonView.ViewModel(person: "BK"))
}
