//
//  CustomizNavigationBar.swift
//  Navigation
//
//  Created by Mac on 15/03/2024.
//

import SwiftUI

struct CustomizNavigationBar: View {
    var body: some View {
        NavigationStack {
            List(0..<100) { i in
                Text("Row \(i)")
            }
            .navigationTitle("Title goes here")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarColorScheme(.dark)
            .toolbar(.hidden, for: .navigationBar)
        }
    }
}

#Preview {
    CustomizNavigationBar()
}
