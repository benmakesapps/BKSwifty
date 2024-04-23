//
//  TemplateCoordinator.swift
//  BKSwifty
//
//  Created by Benjamin Kelsey on 4/20/24.
//

import SwiftUI

struct TemplateCoordinator: View {
    var body: some View {
        TemplateView(viewModel: createViewModel())
    }
    
    func createViewModel() -> TemplateView.ViewModel {
        .init()
    }
}
