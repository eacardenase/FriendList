//
//  FriendListApp.swift
//  FriendList
//
//  Created by Edwin Cardenas on 5/11/26.
//

import SwiftData
import SwiftUI

@main
struct FriendListApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
