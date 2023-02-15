//
//  DetailView.swift
//  FriendFace_CoreData
//
//  Created by Biagio Ricci on 15/02/23.
//

import SwiftUI

struct DetailView: View {
    let user: CachedUser
    var body: some View {
        ScrollView{
            VStack{
                Text("\(user.wrappedName)")
                    .font(.title)
                    .frame(maxWidth: .infinity, alignment: .center)
                
                VStack(alignment: .leading, spacing: 20){
                    Text("About: \(user.wrappedAbout)")
                    Text("Email: \(user.wrappedEmail)")
                    Text("Address: \(user.wrappedAddress)")
                    Text("Company: \(user.wrappedCompany)")
                    ForEach(user.friendsArray) { friend in
                        Text(friend.wrappedName)
                    }
                    Text("Registered on: \(user.wrappedRegistered)")
                }
                .padding()
            }
        }
    }
}
