//
//  EditableNavigationTitle.swift
//  Navigation
//
//  Created by Mac on 15/03/2024.
//

import SwiftUI

struct EditableNavigationTitle: View {
    @State private var title = "SwiftUI"

       var body: some View {
           NavigationStack {
               Text("Hello, world!")
                   .navigationTitle($title)
                   .navigationBarTitleDisplayMode(.inline)
           }
       }
}

#Preview {
    EditableNavigationTitle()
}
