//
//  Query.swift
//  BKSwifty
//
//  Created by Benjamin Kelsey on 4/25/24.
//

import CoreData
import Observation

@Observable
final class Query<T: NSManagedObject>: NSObject, NSFetchedResultsControllerDelegate {
    private(set) var items: [T] = []
    private let fetchController: NSFetchedResultsController<T>
    
    init(persistenceManager: PersistenceManager) {
        guard let request = T.fetchRequest() as? NSFetchRequest<T> else {
            fatalError("Failed to create fetch request for \(T.self)")
        }
        request.sortDescriptors = []
        
        fetchController = NSFetchedResultsController<T>(fetchRequest: request,
                                                        managedObjectContext: persistenceManager.container.viewContext,
                                                        sectionNameKeyPath: nil,
                                                        cacheName: nil)
        
        super.init()
        
        fetchController.delegate = self
        
        try? fetch()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<any NSFetchRequestResult>) {
        items = fetchController.fetchedObjects ?? []
    }
}

extension Query {
    func fetch() throws {
        try fetchController.performFetch()
        items = fetchController.fetchedObjects ?? []
    }
    
    func sort<U>(by keyPath: KeyPath<T, U>, ascending: Bool = true) throws {
        let descriptor = NSSortDescriptor(keyPath: keyPath, ascending: ascending)
        fetchController.fetchRequest.sortDescriptors = [descriptor]
        try fetch()
    }
    
    func filter(by predicate: Predicate<T>?) throws {
        let pred = predicate?.build()
        fetchController.fetchRequest.predicate = pred
        try fetch()
    }
}
