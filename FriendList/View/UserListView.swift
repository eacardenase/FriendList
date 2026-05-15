//
//  UserListView.swift
//  FriendList
//
//  Created by Edwin Cardenas on 5/11/26.
//

import SwiftData
import SwiftUI

struct UserListView: View {
    @Query var users: [User]
    @Environment(\.modelContext) var modelContext

    var body: some View {
        List(users) { user in
            NavigationLink {
                UserDetailsView(user: user)
            } label: {
                HStack {
                    VStack(alignment: .leading) {
                        Text(user.name)
                            .font(.headline)

                        Text(user.company)
                            .font(.subheadline)
                    }

                    Spacer()

                    HStack {
                        Circle()
                            .frame(width: 16)
                            .foregroundStyle(user.isActive ? .green : .red)

                        Text(user.isActive ? "Active" : "Inactive")

                        Spacer(minLength: 0)
                    }
                    .frame(width: 100)
                }
            }
        }
        .navigationTitle("Users")
        .task {
            if users.isEmpty {
                await fetchUsers()
            }

        }
    }

    func fetchUsers() async {
        let url = URL(
            string: "https://www.hackingwithswift.com/samples/friendface.json"
        )!

        let request = URLRequest(url: url)

        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601

            let decodedUsers = try decoder.decode([User].self, from: data)

            for user in decodedUsers {
                modelContext.insert(user)
            }
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
