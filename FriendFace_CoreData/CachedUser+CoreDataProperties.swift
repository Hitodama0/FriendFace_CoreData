//
//  CachedUser+CoreDataProperties.swift
//  FriendFace_CoreData
//
//  Created by Biagio Ricci on 16/02/23.
//
//

import Foundation
import CoreData


extension CachedUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedUser> {
        return NSFetchRequest<CachedUser>(entityName: "CachedUser")
    }

    @NSManaged public var about: String?
    @NSManaged public var address: String?
    @NSManaged public var age: Int16
    @NSManaged public var company: String?
    @NSManaged public var email: String?
    @NSManaged public var id: UUID?
    @NSManaged public var isActive: Bool
    @NSManaged public var name: String?
    @NSManaged public var registered: Date?
    @NSManaged public var friend: NSSet?
    
    var wrappedName: String {
        name ?? ""
    }

    var wrappedCompany: String {
        company ?? ""
    }

    var wrappedEmail: String {
        email ?? ""
    }

    var wrappedAddress: String {
        address ?? ""
    }

    var wrappedAbout: String {
        about ?? ""
    }

    var wrappedRegistered: Date {
        registered ?? Date.now
    }
    
    var friendsArray: [CachedFriend] {
        let set = friend as? Set<CachedFriend> ?? []

        return set.sorted {
            $0.wrappedName < $1.wrappedName
        }
    }

}

// MARK: Generated accessors for friend
extension CachedUser {

    @objc(addFriendObject:)
    @NSManaged public func addToFriend(_ value: CachedFriend)

    @objc(removeFriendObject:)
    @NSManaged public func removeFromFriend(_ value: CachedFriend)

    @objc(addFriend:)
    @NSManaged public func addToFriend(_ values: NSSet)

    @objc(removeFriend:)
    @NSManaged public func removeFromFriend(_ values: NSSet)

}

extension CachedUser : Identifiable {

}
