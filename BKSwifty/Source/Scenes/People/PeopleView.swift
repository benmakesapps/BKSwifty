//
//  PeopleView.swift
//  BKSwifty
//
//  Created by Benjamin Kelsey on 4/20/24.
//

import SwiftUI

struct PeopleView: View {
    @Environment(ErrorManager.self)
    var errorManager
    
    @State var viewModel: ViewModel
    
    @State var searchText = ""
    
    var body: some View {
        List {
            ForEach(viewModel.query.items, id: \.objectID) { person in
                NavigationLink {
                    PersonCoordinator(person: person)
                } label: {
                    Text(person.name ?? "--")
                }
            }
            .onDelete(perform: deleteItems)
        }
        .onViewDidLoad {
            do {
                try viewModel.onViewDidLoad()
            } catch {
                errorManager.show(error.localizedDescription)
            }
        }
        .searchable(text: $searchText)
        .onChange(of: searchText) {
            filter()
        }
        .toolbar {
            ToolbarItem(placement: .secondaryAction) {
                Button {
                    toggleSort()
                } label: {
                    Label("Sort", systemImage: viewModel.sortIcon)
                }
            }
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            do {
                try viewModel.delete(at: offsets)
            } catch {
                errorManager.show(error.localizedDescription)
            }
        }
    }
    
    private func toggleSort() {
        do {
            try viewModel.toggleSortOrder()
        } catch {
            errorManager.show(error.localizedDescription)
        }
    }
    
    private func filter() {
        do {
            try viewModel.filter(including: searchText)
        } catch {
            errorManager.show(error.localizedDescription)
        }
    }
}
