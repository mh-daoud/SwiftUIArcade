//
//  Gestures.swift
//  Flashzilla
//
//  Created by Mac on 23/03/2024.
//

import SwiftUI

struct MagnificationGestures: View {
    
    @State private var currentAmount = 0.0
    @State private var finalAmount = 1.0
    
    var body: some View {
        Text("Pinch To Zoom")
            .scaleEffect(finalAmount + currentAmount)
            .gesture(
                MagnifyGesture()
                    .onChanged { value in
                        currentAmount = value.magnification - 1
                    }
                    .onEnded { value in
                        //doing this because onChange will be called with reset magnification if commented two lines below it will be scaled down every time user try to pinch to zoom
                        finalAmount += currentAmount
                        currentAmount = 0
                    }
            )
        
        
    }
}

#Preview {
    MagnificationGestures()
}
