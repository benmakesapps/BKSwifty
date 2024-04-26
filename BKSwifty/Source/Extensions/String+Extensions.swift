//
//  String+Extensions.swift
//  BKSwifty
//
//  Created by Benjamin Kelsey on 4/25/24.
//

import Foundation

extension String: LocalizedError {
    public var errorDescription: String? { return self }
}
