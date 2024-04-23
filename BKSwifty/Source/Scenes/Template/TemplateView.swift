//
//  TemplateView.swift
//  BKSwifty
//
//  Created by Benjamin Kelsey on 4/20/24.
//

import SwiftUI

struct TemplateView: View {
    @State var viewModel: ViewModel
    
    var body: some View {
        Text(viewModel.text)
    }
}

#Preview {
    TemplateView(viewModel: TemplateView.ViewModel())
}
