//
//  ErrorManager.swift
//  BKSwifty
//
//  Created by Benjamin Kelsey on 4/25/24.
//

import Observation

@Observable
class ErrorManager {
    var message: String? = nil
    var showError: Bool = false
    
    func show(_ error: String) {
        self.message = error
        self.showError = true
    }
}
