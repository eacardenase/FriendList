//
//  User.swift
//  FriendList
//
//  Created by Edwin Cardenas on 5/11/26.
//

import Foundation

class User: Codable {
    var id: String
    var name: String
    var age: Int
    var isActive: Bool
    var company: String
    var about: String
    var friends: [Friend]

    init(
        id: String,
        name: String,
        age: Int,
        isActive: Bool,
        company: String,
        about: String,
        friends: [Friend]
    ) {
        self.id = id
        self.name = name
        self.age = age
        self.isActive = isActive
        self.company = company
        self.about = about
        self.friends = friends
    }
}
