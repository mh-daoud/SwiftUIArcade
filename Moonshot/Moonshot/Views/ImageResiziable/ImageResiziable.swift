//
//  ContentView.swift
//  Moonshot
//
//  Created by Mac on 15/03/2024.
//

import SwiftUI

struct ImageResiziable: View {
    var body: some View {
        VStack {
            Image(.image)
                .resizable()
                .scaledToFit()
                .containerRelativeFrame(.horizontal) { size,_ in
                    size * 0.8
                }
               
        }
        .padding()
    }
}

#Preview {
    ImageResiziable()
}
