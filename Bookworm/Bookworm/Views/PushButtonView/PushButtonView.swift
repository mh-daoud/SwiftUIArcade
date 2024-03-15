//
//  PushButtonView.swift
//  Bookworm
//
//  Created by Mac on 15/03/2024.
//

import SwiftUI

struct PushButtonView: View {
    let title: String
    @Binding var isOn: Bool
    
    var onColors = [Color.red, Color.yellow]
    var offColors = [Color(white: 0.6), Color(white: 0.4)]
    
    var body: some View {
        Button(title) {
            isOn.toggle()
        }
        .padding()
        .background(LinearGradient(colors: isOn ? onColors : offColors, startPoint: .top, endPoint: .bottom))
        .foregroundStyle(.white)
        .clipShape(.capsule)
        .shadow(radius: isOn ? 0 : 5)
    }
}

#Preview {
    @State var isOn = false
    return PushButtonView(title: "Button", isOn: $isOn)
}
