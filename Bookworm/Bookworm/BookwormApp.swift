//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Akash Sheelavant on 9/19/24.
//

import SwiftUI
import SwiftData

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
