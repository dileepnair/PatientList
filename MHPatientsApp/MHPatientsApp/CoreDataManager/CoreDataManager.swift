//
//  CoreDataManager.swift
//  MHPatientsApp
//
//  Created by Dileep Sanker on 8/30/19.
//  Copyright © 2019 Dileep Sanker. All rights reserved.
//

import CoreData

/*
 Type    : Class
 Message : Class to manage all core data activities
 */

final class CoreDataManager {
    static let sharedManager = CoreDataManager()
    
    lazy var persistentContainer : NSPersistentContainer = {
        let container = NSPersistentContainer.init(name: "MHPatients")
        container.loadPersistentStores(completionHandler: { [weak self](iDescription, iError) in
            if let storeError = iError {
                print("Error while creting store \(storeError)")
            }
        })
        
        return container
    }()
    
    
    lazy var viewContext : NSManagedObjectContext = {
        self.persistentContainer.viewContext.automaticallyMergesChangesFromParent = true
        return self.persistentContainer.viewContext
    }()
    
    
    lazy var backgroundContext : NSManagedObjectContext = {
        return self.persistentContainer.newBackgroundContext()
    }()
    
    
    func performBackgroundTask(_ block: @escaping (NSManagedObjectContext) -> Void) {
        self.persistentContainer.performBackgroundTask(block)
    }
    
    
    func performForegroundTask(_ block : @escaping (NSManagedObjectContext) -> Void) {
        self.viewContext.perform {
            block(self.viewContext)
        }
    }
    
    
    func saveViewContext() -> Bool {
        var saveSuccess = true
        
        if self.viewContext.hasChanges {
            do {
                try self.viewContext.save()
            } catch {
                print( "Saving View context Failed with error : \(error)")
                self.viewContext.rollback()
                saveSuccess = false
            }
        }
        return saveSuccess
    }
}

