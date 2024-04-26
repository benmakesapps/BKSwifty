//
//  PredicateTests.swift
//  BKSwiftyTests
//
//  Created by Benjamin Kelsey on 4/26/24.
//

import XCTest
@testable import BKSwifty

class PredicateTests: XCTestCase {
    func testEquals() {
        let expected = NSPredicate(format: "name == %@", "Ben")
        let sut = Predicate<Person>()
            .equals(\Person.name, "Ben")
            .build()
        XCTAssertEqual(sut.predicateFormat, expected.predicateFormat)
    }
    
    func testContainsSubstringCaseInsensitive() {
        let expected = NSPredicate(format: "name CONTAINS[c] %@", "Be")
        let sut = Predicate<Person>()
            .containsSubstring(\Person.name, "Be")
            .build()
        XCTAssertEqual(sut.predicateFormat, expected.predicateFormat)
    }

    func testContainsSubstringCaseSensitive() {
        let expected = NSPredicate(format: "name CONTAINS %@", "Be")
        let sut = Predicate<Person>()
            .containsSubstring(\Person.name, "Be", caseSensitive: true)
            .build()
        XCTAssertEqual(sut.predicateFormat, expected.predicateFormat)
    }
    
    func testChainingConditions() {
        let expected = NSPredicate(format: "name == %@ AND name CONTAINS[c] %@", "Ben", "Be")
        let sut = Predicate<Person>()
            .equals(\Person.name, "Ben")
            .containsSubstring(\Person.name, "Be", caseSensitive: false)
            .build()
        XCTAssertEqual(sut.predicateFormat, expected.predicateFormat)
    }
}
