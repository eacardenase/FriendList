//
//  UserDetailsView.swift
//  FriendList
//
//  Created by Edwin Cardenas on 5/11/26.
//

import SwiftUI

struct UserDetailsView: View {
    let user: User

    var body: some View {
        ScrollView {
            VStack {
                Text(user.name)
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)

                Text(user.company)
                    .font(.subheadline.italic())
                    .foregroundStyle(.secondary)
            }
            .padding(.bottom, 16)

            VStack(alignment: .leading, spacing: 16) {

                VStack(alignment: .leading, spacing: 8) {
                    Text("About")
                        .font(.title)

                    Text(user.about)
                }

                DividerView()

                VStack(alignment: .leading, spacing: 8) {
                    Text("Friends")
                        .font(.title)

                    ForEach(user.friends, id: \.id) {
                        Text($0.name)
                    }
                }
            }

        }
        .padding(.horizontal, 16)
        .scrollBounceBehavior(.basedOnSize)
        .scrollIndicators(.never)
    }
}

#Preview {
    let user = User(
        id: "test",
        name: "Edwin Cardenas",
        age: 30,
        isActive: true,
        company: "Topaz",
        about:
            "Occaecat consequat elit aliquip magna laboris dolore laboris sunt officia adipisicing reprehenderit sunt. Do in proident consectetur labore. Laboris pariatur quis incididunt nostrud labore ad cillum veniam ipsum ullamco. Dolore laborum commodo veniam nisi. Eu ullamco cillum ex nostrud fugiat eu consequat enim cupidatat. Non incididunt fugiat cupidatat reprehenderit nostrud eiusmod eu sit minim do amet qui cupidatat. Elit aliquip nisi ea veniam proident dolore exercitation irure est deserunt.",
        friends: [
            Friend(id: "0", name: "Luisa"),
            Friend(id: "1", name: "Wilder"),
            Friend(id: "2", name: "Pineda"),
        ]
    )

    UserDetailsView(user: user)
}
