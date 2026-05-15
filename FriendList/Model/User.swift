//
//  User.swift
//  FriendList
//
//  Created by Edwin Cardenas on 5/11/26.
//

import Foundation
import SwiftData

@Model
class User: Codable {
    var id: String
    var name: String
    var age: Int
    var isActive: Bool
    var company: String
    var about: String
    var registered: Date
    var friends: [Friend]

    init(
        id: String,
        name: String,
        age: Int,
        isActive: Bool,
        company: String,
        about: String,
        registered: Date,
        friends: [Friend]
    ) {
        self.id = id
        self.name = name
        self.age = age
        self.isActive = isActive
        self.company = company
        self.about = about
        self.registered = registered
        self.friends = friends
    }

    required init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.age = try container.decode(Int.self, forKey: .age)
        self.isActive = try container.decode(Bool.self, forKey: .isActive)
        self.company = try container.decode(String.self, forKey: .company)
        self.about = try container.decode(String.self, forKey: .about)
        self.registered = try container.decode(Date.self, forKey: .registered)
        self.friends = try container.decode([Friend].self, forKey: .friends)
    }

    enum CodingKeys: CodingKey {
        case id
        case name
        case age
        case isActive
        case company
        case about
        case registered
        case friends
    }

    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.age, forKey: .age)
        try container.encode(self.isActive, forKey: .isActive)
        try container.encode(self.company, forKey: .company)
        try container.encode(self.about, forKey: .about)
        try container.encode(self.registered, forKey: .registered)
        try container.encode(self.friends, forKey: .friends)
    }
}
