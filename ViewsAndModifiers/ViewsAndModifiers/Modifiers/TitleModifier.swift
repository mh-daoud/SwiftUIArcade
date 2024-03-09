//
//  TitleModifyer.swift
//  ViewsAndModifiers
//
//  Created by Mac on 09/03/2024.
//

import SwiftUI

struct TitleModifier : ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundStyle(.white)
            .padding()
            .background(.blue)
            .clipShape(.rect(cornerRadius: 10))
    }
}


extension View {
    func titleStyle() -> some View {
        modifier(TitleModifier())
    }
}
