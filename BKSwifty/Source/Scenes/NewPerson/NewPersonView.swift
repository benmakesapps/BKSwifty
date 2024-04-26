//
//  NewPersonView.swift
//  BKSwifty
//
//  Created by Benjamin Kelsey on 4/20/24.
//

import SwiftUI

struct NewPersonView: View {
    @Environment(\.dismiss) 
    var dismiss
    
    @Environment(ErrorManager.self)
    var errorManager
    
    @State var viewModel: ViewModel
    
    @State var text: String = ""
    
    var body: some View {
        TextField(text: $text) {
            Text("New person")
        }
        .padding()
        .onSubmit {
            do {
                try viewModel.savePerson(text)
                dismiss()
            } catch {
                errorManager.show(error.localizedDescription)
            }
        }
    }
}

#Preview {
    NewPersonView(viewModel: NewPersonView.ViewModel(persistenceManager: PersistenceManager()))
}
