//
//  ContentView.swift
//  HotProspects
//
//  Created by Mac on 22/03/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(.example)
                .interpolation(.none)
                .resizable()
                .scaledToFit()
                .background(.black)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
