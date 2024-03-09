//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Mac on 09/03/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.red
                .watermarked(with: "nopa was here")
                .ignoresSafeArea()
            VStack {
                Spacer()
                TitleLabel(title: "Learning Modifiers")
                Spacer()
                VStack(spacing: 30) {
                    CapsuledText(text: "Hello")
                    CapsuledText(text: "World")
                        .foregroundColor(.red)
                }
                Spacer()
                Spacer()
            }
            
        }
        
    }
}

#Preview {
    ContentView()
}
