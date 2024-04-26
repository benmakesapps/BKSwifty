//
//  Predicate.swift
//  BKSwifty
//
//  Created by Benjamin Kelsey on 4/26/24.
//

import Foundation

class Predicate<T> {
    private var predicateFormat = ""
    private var arguments: [Any] = []

    @discardableResult
    func equals<U: Equatable>(_ keyPath: KeyPath<T, U>, _ value: U) -> Self {
        appendPredicate(format: "%K == %@", 
                        argumentArray: [NSExpression(forKeyPath: keyPath).keyPath, value])
        return self
    }
    
    @discardableResult
    func containsSubstring(_ keyPath: KeyPath<T, String?>, _ substring: String, caseSensitive: Bool = false) -> Self {
        let comparisonModifier = caseSensitive ? "" : "[c]"
        appendPredicate(format: "%K CONTAINS\(comparisonModifier) %@", 
                        argumentArray: [NSExpression(forKeyPath: keyPath).keyPath, substring])
        return self
    }
    
    // Many more predicates can be added as needed, keeping it simple for now

    private func appendPredicate(format: String, argumentArray: [Any]) {
        if !predicateFormat.isEmpty {
            predicateFormat += " AND "
        }
        predicateFormat += format
        arguments.append(contentsOf: argumentArray)
    }

    func build() -> NSPredicate {
        NSPredicate(format: predicateFormat, argumentArray: arguments)
    }
}
