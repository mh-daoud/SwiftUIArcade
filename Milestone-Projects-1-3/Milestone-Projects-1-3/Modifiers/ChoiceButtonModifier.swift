//
//  ChoiceButton.swift
//  Milestone-Projects-1-3
//
//  Created by Mac on 09/03/2024.
//

import SwiftUI


struct ChoiceButtonModifier : ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title2.bold())
            .foregroundStyle(.white)
            .padding(.vertical, 12)
            .padding(.horizontal, 24)
            .background(.purple.gradient)
            .clipShape(.capsule)
    }
}


extension View {
    func choiceBorder() -> some View {
        modifier(ChoiceButtonModifier())
    }
}
