//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Mac on 23/03/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            NavigationLink {
                    Text("New secondary")
                } label: {
                    Text("Hello, World!")
                }
                .navigationTitle("Primary")

                Text("Secondary")
            
            Text("Third")
        }
    }
}

#Preview {
    ContentView()
}
