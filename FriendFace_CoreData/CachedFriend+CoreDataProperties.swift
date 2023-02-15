//
//  CachedFriend+CoreDataProperties.swift
//  FriendFace_CoreData
//
//  Created by Biagio Ricci on 16/02/23.
//
//

import Foundation
import CoreData


extension CachedFriend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedFriend> {
        return NSFetchRequest<CachedFriend>(entityName: "CachedFriend")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var user: CachedUser?
    
    var wrappedName: String {
        name ?? ""
    }

}

extension CachedFriend : Identifiable {

}
