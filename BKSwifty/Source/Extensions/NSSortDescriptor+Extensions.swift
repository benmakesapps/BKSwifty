//
//  NSSortDescriptor+Extensions.swift
//  BKSwifty
//
//  Created by Benjamin Kelsey on 4/25/24.
//

import Foundation

extension NSSortDescriptor {
    convenience init<Root, Value>(keyPath: KeyPath<Root, Value>, ascending: Bool = true) {
        let keyPathString = NSExpression(forKeyPath: keyPath).keyPath
        self.init(key: keyPathString, ascending: ascending)
    }
}
