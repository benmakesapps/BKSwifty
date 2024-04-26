//
//  PersistenceManagerTests.swift
//  BKSwiftyTests
//
//  Created by Benjamin Kelsey on 4/26/24.
//

import XCTest
@testable import BKSwifty

final class PersistenceManagerTests: XCTestCase {
    
    func testNewObject_CreatesInstanceOfManagedObject() {
        let sut = PersistenceManager(inMemory: true)
        do {
            let person: Person = try sut.newObject(ofType: Person.self)
            XCTAssertNotNil(person)
            XCTAssertEqual(sut.container.viewContext.registeredObjects.count, 1)
        } catch {
            XCTFail()
        }
    }
    
    func testSave_ContextHasChanges_SavesWithoutError() {
        let sut = PersistenceManager(inMemory: true)
        do {
            let person = try sut.newObject(ofType: Person.self)
            person.name = "Test User"
            XCTAssertNoThrow(try sut.save())
            XCTAssertEqual(sut.container.viewContext.registeredObjects.count, 1)
        } catch {
            XCTFail()
        }
    }
    
    func testDelete_DeletesObjectAfterSave() {
        let sut = PersistenceManager(inMemory: true)
        do {
            let person: Person = try sut.newObject(ofType: Person.self)
            var numberOfObjects = sut.container.viewContext.registeredObjects.count
            XCTAssertEqual(numberOfObjects, 1)
            
            XCTAssertNoThrow(try sut.delete(person, save: false))
            numberOfObjects = sut.container.viewContext.registeredObjects.count
            XCTAssertEqual(numberOfObjects, 1)
            
            XCTAssertNoThrow(try sut.save())
            numberOfObjects = sut.container.viewContext.registeredObjects.count
            XCTAssertEqual(numberOfObjects, 0)
        } catch {
            XCTFail()
        }
    }
    
    func testDelete_DeletesObjectImmediately() {
        let sut = PersistenceManager(inMemory: true)
        do {
            let person: Person = try sut.newObject(ofType: Person.self)
            var numberOfObjects = sut.container.viewContext.registeredObjects.count
            XCTAssertEqual(numberOfObjects, 1)
            
            XCTAssertNoThrow(try sut.delete(person, save: true))
            numberOfObjects = sut.container.viewContext.registeredObjects.count
            XCTAssertEqual(numberOfObjects, 0)
        } catch {
            XCTFail()
        }
    }

}
