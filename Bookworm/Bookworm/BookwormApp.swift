//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Mac on 15/03/2024.
//

import SwiftUI
import SwiftData
@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            BookListView()
        }
        .modelContainer(for: Book.self)
    }
}
