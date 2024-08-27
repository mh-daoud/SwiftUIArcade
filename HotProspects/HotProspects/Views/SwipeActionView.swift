//
//  SwipeActionView.swift
//  HotProspects
//
//  Created by Mac on 22/03/2024.
//

import SwiftUI

struct SwipeActionView: View {
    var body: some View {
        List {
            Text("Taylor Swift")
                .swipeActions(edge: .leading) {
                    Button("Send message", systemImage: "message") {
                        print("Hi")
                    }
                    .tint(.green)
                    Button("Call", systemImage: "phone") {
                        print("Hi")
                    }
                    .tint(.blue)
                }
                .swipeActions(edge: .trailing) {
                    Button("Call", systemImage: "trash", role: .destructive) {
                        print("Hi")
                    }
                    
                }
        }
    }
}

#Preview {
    SwipeActionView()
}
