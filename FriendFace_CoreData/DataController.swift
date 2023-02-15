//
//  DataController.swift
//  FriendFace_CoreData
//
//  Created by Biagio Ricci on 16/02/23.
//

import CoreData
import Foundation

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "FriendFace_CoreData")
    
    init() {
        container.loadPersistentStores{description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
