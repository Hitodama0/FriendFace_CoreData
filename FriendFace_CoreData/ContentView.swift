//
//  ContentView.swift
//  FriendFace_CoreData
//
//  Created by Biagio Ricci on 15/02/23.
//

import SwiftUI



struct ContentView: View {
    @FetchRequest(sortDescriptors: []) var users: FetchedResults<CachedUser>
    @Environment(\.managedObjectContext) var moc
    var body: some View {
        NavigationView {
            List(users){
                user in  NavigationLink {
                    DetailView(user: user)
                } label: {
                    HStack {
                        Circle()
                            .fill(user.isActive ? .green : .red)
                            .frame(width: 30)

                        Text(user.wrappedName)
                    }
                }
            }
            .navigationTitle("Friendface")
            .task {
                await loadData()
            }
        }
    }
    func loadData() async {
        guard users.isEmpty else { return }
        
        
        do {
            guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
                print("Invalid URL")
                return
            }
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let users = try decoder.decode([User].self, from: data)
            
            await MainActor.run {
                update(with: users)}
        } catch {
            print("Download Failed")
        }
    }
    
    func update(with downloadedUsers: [User]){
        for user in downloadedUsers {
            let cachedUser = CachedUser(context: moc)
            cachedUser.id = user.id
            cachedUser.isActive = user.isActive
            cachedUser.name = user.name
            cachedUser.age = Int16(user.age)
            cachedUser.company = user.company
            cachedUser.email = user.email
            cachedUser.address = user.address
            cachedUser.about = user.about
            cachedUser.registered = user.registered
            
            for friend in user.friends {
                let cachedFriend = CachedFriend(context: moc)
                cachedFriend.id = friend.id
                cachedFriend.name = friend.name
                cachedUser.addToFriend(cachedFriend)
            }
        }
        try? moc.save()
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
