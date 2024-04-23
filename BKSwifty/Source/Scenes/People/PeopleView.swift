//
//  PeopleView.swift
//  CoreDataObservable
//
//  Created by Benjamin Kelsey on 4/20/24.
//

import SwiftUI

struct PeopleView: View {
    @State var viewModel: ViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.people, id: \.self) { person in
                Text(person)
            }
        }
    }
}

#Preview {
    PeopleView(viewModel: PeopleView.ViewModel())
}
