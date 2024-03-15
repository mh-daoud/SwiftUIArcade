//
//  ContentView.swift
//  Bookworm
//
//  Created by Mac on 15/03/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var rememberMe = false
    
    var body: some View {
        VStack {
            PushButtonView(title: "Remember Me", isOn: $rememberMe)
            Text(rememberMe ? "On" : "Off")
        }
    }
}

#Preview {
    ContentView()
}
