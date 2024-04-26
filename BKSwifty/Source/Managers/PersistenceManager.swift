//
//  PersistenceManager.swift
//  BKSwifty
//
//  Created by Benjamin Kelsey on 4/23/24.
//

import CoreData
import Observation

@Observable
class PersistenceManager {
    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = PersistenceManager.createContainer(inMemory: inMemory)
    }
    
    func save() throws {
        try container.viewContext.save()
    }
    
    func delete(_ object: NSManagedObject, save: Bool = true) throws {
        container.viewContext.delete(object)
        if save {
            try self.save()
        }
    }
    
    func newObject<T: NSManagedObject>(ofType type: T.Type) throws -> T {
        let entityName = String(describing: type)
        guard let entity = NSEntityDescription.entity(forEntityName: entityName,
                                                      in: container.viewContext) else {
            throw "Unknown entity name: \(entityName)"
        }
        let newObject = T(entity: entity,
                          insertInto: container.viewContext)
        return newObject
    }
    
    func query<T>() -> Query<T> {
        Query(persistenceManager: self)
    }
}

private extension PersistenceManager {
    static func createContainer(inMemory: Bool = false) -> NSPersistentContainer {
        let container = NSPersistentContainer(name: "Data")
        
        if inMemory {
            let description = NSPersistentStoreDescription()
            description.type = NSInMemoryStoreType
            container.persistentStoreDescriptions = [description]
        }
        
        container.loadPersistentStores { (storeDescription, error) in
            if let error {
                fatalError(error.localizedDescription)
            }
        }
        return container
    }
}
