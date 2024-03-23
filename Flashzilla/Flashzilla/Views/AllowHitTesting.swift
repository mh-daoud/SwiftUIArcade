//
//  AllowHitTesting.swift
//  Flashzilla
//
//  Created by Mac on 23/03/2024.
//

import SwiftUI

struct AllowHitTesting: View {
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .fill(.blue)
                    .frame(width: 300, height: 300)
                    .onTapGesture {
                        print("Rectangle tapped!")
                    }

                Circle()
                    .fill(.red)
                    .frame(width: 300, height: 300)
                    .contentShape(.rect)
                    .onTapGesture {
                        print("Circle tapped!")
                    }
                    //.allowsHitTesting(false)
                
            }
            
            VStack {
                Text("Hello")
                Spacer().frame(height: 100)
                Text("World")
            }
            .contentShape(.rect)
            .onTapGesture {
                print("VStack tapped!")
            }
        }
    }
}

#Preview {
    AllowHitTesting()
}
