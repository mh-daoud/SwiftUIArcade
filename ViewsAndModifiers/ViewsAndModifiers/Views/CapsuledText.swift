//
//  CapsuledText.swift
//  ViewsAndModifiers
//
//  Created by Mac on 09/03/2024.
//

import SwiftUI


struct CapsuledText : View {
    var text: String
    var body: some View {
        Group {
            Text(text)
                .font(.title.bold())
                .padding()
                .background(.blue)
                .clipShape(.capsule)
        }
        .foregroundColor(.white)
    }
}




#Preview {
    CapsuledText(text: "Some Text")
}
