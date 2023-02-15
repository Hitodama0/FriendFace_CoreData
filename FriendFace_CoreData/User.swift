//
//  User.swift
//  FriendFace_CoreData
//
//  Created by Biagio Ricci on 15/02/23.
//

import Foundation

struct Friend: Codable, Identifiable {
    var id: UUID
    var name: String
}

struct User: Codable, Identifiable{
    var id: UUID
    var isActive: Bool
    var name: String
    var email: String
    var company: String
    var age: Int
    var address: String
    var about: String
    var registered: Date
    
    var friends: [Friend]
}
