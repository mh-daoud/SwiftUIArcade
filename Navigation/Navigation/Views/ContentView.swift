//
//  ContentView.swift
//  Navigation
//
//  Created by Mac on 15/03/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var path = PathStore()
    
    var body: some View {
        NavigationStack(path: $path.path) {
            DetailView(number: 0)
                .navigationDestination(for: Int.self) { i in
                    DetailView(number: i)
                }
        }
    }
}


#Preview {
    ContentView()
}
