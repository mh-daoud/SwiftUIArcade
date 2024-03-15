//
//  ControlPlacement.swift
//  Navigation
//
//  Created by Mac on 15/03/2024.
//

import SwiftUI

struct ControlPlacement: View {
    var body: some View {
        NavigationStack {
            Text("Hello, world!")
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    Button("Tap Me") {
                        // button action here
                    }
                }
            }
        }
    }
}

#Preview {
    ControlPlacement()
}
