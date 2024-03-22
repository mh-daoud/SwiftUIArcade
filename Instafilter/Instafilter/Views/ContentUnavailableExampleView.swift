//
//  ContentUnavailableExampleView.swift
//  Instafilter
//
//  Created by Mac on 22/03/2024.
//

import SwiftUI

struct ContentUnavailableExampleView: View {
    var body: some View {
        ContentUnavailableView("No snippets", systemImage: "swift")
        ContentUnavailableView("No snippets", systemImage: "swift", description: Text("You don't have any saved snippets yet."))
        ContentUnavailableView {
            Label("No snippets", systemImage: "swift")
        } description: {
            Text("You don't have any saved snippets yet.")
        } actions: {
            Button("Create Snippet") {
                // create a snippet
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    ContentUnavailableExampleView()
}
