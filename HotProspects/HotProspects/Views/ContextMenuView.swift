//
//  ContextMenuView.swift
//  HotProspects
//
//  Created by Mac on 22/03/2024.
//

import SwiftUI

struct ContextMenuView: View {
    @State private var backgroundColor = Color.red

       var body: some View {
           VStack {
               Text("Hello, World!")
                   .padding()
                   .background(backgroundColor)

               Text("Change Color")
                   .padding()
                   .contextMenu {
                       Button("Red", systemImage: "checkmark.circle.fill", role: .destructive) {
                           backgroundColor = .red
                       }

                       Button("Green") {
                           backgroundColor = .green
                       }

                       Button("Blue") {
                           backgroundColor = .blue
                       }
                   }
           }
       }
}

#Preview {
    ContextMenuView()
}
