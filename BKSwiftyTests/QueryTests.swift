//
//  QueryTests.swift
//  BKSwiftyTests
//
//  Created by Benjamin Kelsey on 4/26/24.
//

import XCTest
@testable import BKSwifty

final class QueryTests: XCTestCase {

    func testQuery_ReturnsNothing() {
        let persistenceManager = PersistenceManager(inMemory: true)
        let sut: Query<Person> = persistenceManager.query()
        XCTAssert(sut.items.isEmpty)
    }
    
    func testQuery_ReturnsEntry() {
        let persistenceManager = PersistenceManager(inMemory: true)
        XCTAssertNoThrow(try persistenceManager.newObject(ofType: Person.self))
        let sut: Query<Person> = persistenceManager.query()
        XCTAssert(sut.items.count == 1)
    }
    
    func testQuery_ReturnsEntryWithFilter() {
        let persistenceManager = PersistenceManager(inMemory: true)
        do {
            let person = try persistenceManager.newObject(ofType: Person.self)
            person.name = "Ben"
            XCTAssertNoThrow(try persistenceManager.save())
            
            let sut: Query<Person> = persistenceManager.query()
            XCTAssertNoThrow(try sut.filter(by: .init().containsSubstring(\.name, "B")))
            XCTAssertEqual(sut.items.count, 1)
            XCTAssertEqual(sut.items.first?.name, "Ben")
        } catch {
            XCTFail()
        }
    }
    
    func testQuery_ReturnsNothingWithFilter() {
        let persistenceManager = PersistenceManager(inMemory: true)
        do {
            let person = try persistenceManager.newObject(ofType: Person.self)
            person.name = "Ben"
            XCTAssertNoThrow(try persistenceManager.save())
            
            let sut: Query<Person> = persistenceManager.query()
            XCTAssertNoThrow(try sut.filter(by: .init().containsSubstring(\.name, "J")))
            XCTAssert(sut.items.isEmpty)
        } catch {
            XCTFail()
        }
    }
    
    func testQuery_ReturnsSortedEntriesAscending() {
        let persistenceManager = PersistenceManager(inMemory: true)
        
        do {
            let person1 = try persistenceManager.newObject(ofType: Person.self)
            person1.name = "Ben"
            
            let person2 = try persistenceManager.newObject(ofType: Person.self)
            person2.name = "Jessica"
            
            let person3 = try persistenceManager.newObject(ofType: Person.self)
            person3.name = "Nora"
            
            XCTAssertNoThrow(try persistenceManager.save())
            
            let sut: Query<Person> = persistenceManager.query()
            XCTAssertNoThrow(try sut.sort(by: \Person.name, ascending: true))
            
            XCTAssertEqual(sut.items.count, 3)
            XCTAssertEqual(sut.items.first?.name, "Ben")
            XCTAssertEqual(sut.items.last?.name, "Nora")
        } catch {
            XCTFail()
        }
    }
    
    func testQuery_ReturnsSortedEntriesDescending() {
        let persistenceManager = PersistenceManager(inMemory: true)
        
        do {
            let person1 = try persistenceManager.newObject(ofType: Person.self)
            person1.name = "Ben"
            
            let person2 = try persistenceManager.newObject(ofType: Person.self)
            person2.name = "Jessica"
            
            let person3 = try persistenceManager.newObject(ofType: Person.self)
            person3.name = "Nora"
            
            XCTAssertNoThrow(try persistenceManager.save())
            
            let sut: Query<Person> = persistenceManager.query()
            XCTAssertNoThrow(try sut.sort(by: \Person.name, ascending: false))
            
            XCTAssertEqual(sut.items.count, 3)
            XCTAssertEqual(sut.items.last?.name, "Ben")
            XCTAssertEqual(sut.items.first?.name, "Nora")
        } catch {
            
        }
    }

}
