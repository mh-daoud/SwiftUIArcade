//
//  SwiftDataProjectApp.swift
//  SwiftDataProject
//
//  Created by Mac on 15/03/2024.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
