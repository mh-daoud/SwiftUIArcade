//
//  ScrollViewWithGeometry2.swift
//  LayoutAndGeometry
//
//  Created by Mac on 23/03/2024.
//

import SwiftUI

struct ScrollViewWithGeometryView2: View {
    var body: some View {
          ScrollView(.horizontal, showsIndicators: false) {
              HStack(spacing: 0) {
                  ForEach(1..<20) { num in
                      GeometryReader { proxy in
                          Text("Number \(num)")
                              .font(.largeTitle)
                              .padding()
                              .background(.red)
                              .rotation3DEffect(.degrees(-proxy.frame(in: .global).minX) / 8, axis: (x: 0, y: 1, z: 0))
                              .frame(width: 200, height: 200)
                      }
                      .frame(width: 200, height: 200)
                  }
              }
          }
      }
}

#Preview {
    ScrollViewWithGeometryView2()
}
