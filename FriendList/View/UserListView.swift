//
//  UserListView.swift
//  FriendList
//
//  Created by Edwin Cardenas on 5/11/26.
//

import SwiftUI

struct UserListView: View {
    @State private var users = [User]()

    var body: some View {
        List(users, id: \.id) { user in
            Text(user.name)
        }
        .navigationTitle("Users")
        .task {
            await fetchUsers()
        }
    }

    func fetchUsers() async {
        let url = URL(
            string: "https://www.hackingwithswift.com/samples/friendface.json"
        )!

        let request = URLRequest(url: url)

        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let decodedUsers = try JSONDecoder().decode([User].self, from: data)

            users = decodedUsers
        } catch {
            print(
                "Failed to fetch users with error: \(error.localizedDescription)"
            )
        }
    }
}

#Preview {
    UserListView()
}
