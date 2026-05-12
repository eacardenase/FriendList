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
        Text(user.name)
    }
}

#Preview {
    let user = User(
        id: "test",
        name: "Edwin Cardenas",
        age: 30,
        isActive: true,
        company: "Topaz",
        friends: []
    )

    UserDetailsView(user: user)
}
