//
//  NavigationExample.swift
//  Moonshot
//
//  Created by Mac on 15/03/2024.
//

import SwiftUI

struct NavigationExample: View {
    var body: some View {
        NavigationStack {
            List(0..<100) { row in
                NavigationLink("Row \(row)") {
                    Text("Detail \(row)")
                }
            }
            .navigationTitle("SwiftUI")
        }
    }
}

#Preview {
    NavigationExample()
}
