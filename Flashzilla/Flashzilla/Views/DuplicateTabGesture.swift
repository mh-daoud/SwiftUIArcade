//
//  DuplicateTabGesture.swift
//  Flashzilla
//
//  Created by Mac on 23/03/2024.
//

import SwiftUI

struct DuplicateTabGesture: View {
    var body: some View {
        VStack {
            Text("Hello, World!")
                .onTapGesture {
                    print("Text tapped")
                }
        }
        .simultaneousGesture(
            TapGesture()
                .onEnded {
                    print("VStack tapped")
                }
        )
    }
}

#Preview {
    DuplicateTabGesture()
}
