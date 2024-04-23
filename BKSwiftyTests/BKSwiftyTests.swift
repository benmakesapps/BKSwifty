//
//  BKSwiftyTests.swift
//  BKSwiftyTests
//
//  Created by Benjamin Kelsey on 4/22/24.
//

import XCTest
@testable import BKSwifty

final class BKSwiftyTests: XCTestCase {

    /// `Given` an array of String
    /// `When` creating PeopleView.ViewModel with said array
    /// `Then` PeopleView.ViewModel.people is the provided array
    func test_injectedPeoplePopulateViewModel() {
        let people = ["Jim", "Pam", "Cece"]
        let sut = PeopleView.ViewModel(people: people)
        XCTAssert(sut.people == people)
    }

}
