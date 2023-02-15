//
//  FriendFace_CoreDataApp.swift
//  FriendFace_CoreData
//
//  Created by Biagio Ricci on 15/02/23.
//

import SwiftUI

@main
struct FriendFace_CoreDataApp: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
