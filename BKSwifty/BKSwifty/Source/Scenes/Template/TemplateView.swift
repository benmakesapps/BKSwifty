//
//  TemplateView.swift
//  CoreDataObservable
//
//  Created by Benjamin Kelsey on 4/20/24.
//

import SwiftUI

struct TemplateView: View {
    @State var viewModel: ViewModel
    
    var body: some View {
        Text("Hello world")
    }
}

#Preview {
    TemplateView(viewModel: TemplateView.ViewModel())
}
