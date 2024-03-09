//
//  WatermarkModifier.swift
//  ViewsAndModifiers
//
//  Created by Mac on 09/03/2024.
//

import SwiftUI

struct WatermarkModifier : ViewModifier {
    var text: String
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .frame(maxWidth: .infinity)
                .font(.caption)
                .foregroundStyle(.white)
                .padding(5)
                .background(.black)
        }
    }
}


extension View {
    func watermarked(with text: String) -> some View {
        modifier(WatermarkModifier(text: text))
    }
}
