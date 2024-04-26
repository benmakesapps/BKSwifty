//
//  PersonView.swift
//  BKSwifty
//
//  Created by Benjamin Kelsey on 4/20/24.
//

import SwiftUI

struct PersonView: View {
    @Environment(\.dismiss) 
    var dismiss
    
    @Environment(ErrorManager.self)
    var errorManager
    
    @State var viewModel: ViewModel
    
    @State var text: String = ""
    
    var body: some View {
        TextField(text: $text) {
            Text(viewModel.person.name ?? "--")
        }
        .padding()
        .onSubmit {
            do {
                try viewModel.updatePerson(with: text)
                dismiss()
            } catch {
                errorManager.show(error.localizedDescription)
            }
        }
    }
}
