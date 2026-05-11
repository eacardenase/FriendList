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
    var friends: [Friend]
}
