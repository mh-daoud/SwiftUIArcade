//
//  ContentView.swift
//  BucketList
//
//  Created by Mac on 22/03/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button("Read and Write") {
            let data = Data("Test Message".utf8)
            let url = URL.documentsDirectory.appending(path: "message.txt")

            do {
                try data.write(to: url, options: [.atomic, .completeFileProtection])
                let input = try String(contentsOf: url)
                print(input)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

#Preview {
    ContentView()
}
