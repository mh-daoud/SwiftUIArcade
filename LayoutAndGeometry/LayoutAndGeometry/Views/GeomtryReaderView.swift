//
//  GeomtryReaderView.swift
//  LayoutAndGeometry
//
//  Created by Mac on 23/03/2024.
//

import SwiftUI

struct GeomtryReaderView: View {
    var body: some View {
        GeometryReader { proxy in
            Image(.background)
                .resizable()
                .scaledToFit()
                .frame(width: proxy.size.width * 0.8)
                .frame(width: proxy.size.width, height: proxy.size.height)
                .background(.red)
        }
    }
}

#Preview {
    GeomtryReaderView()
}
