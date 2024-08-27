//
//  HotProspectsApp.swift
//  HotProspects
//
//  Created by Mac on 22/03/2024.
//

import SwiftUI
import SwiftData
@main
struct HotProspectsApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
        }
        .modelContainer(for: Prospect.self)
    }
}
