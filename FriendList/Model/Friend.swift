//
//  Friend.swift
//  FriendList
//
//  Created by Edwin Cardenas on 5/11/26.
//

import Foundation

class Friend: Codable {
    var id: String
    var name: String

    init(id: String, name: String) {
        self.id = id
        self.name = name
    }
}
