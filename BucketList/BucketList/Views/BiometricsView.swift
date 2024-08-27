//
//  BiometricsView.swift
//  BucketList
//
//  Created by Mac on 22/03/2024.
//

import SwiftUI
import LocalAuthentication

struct BiometricsView: View {
    @State private var isUnlocked = false

    var body: some View {
        VStack {
            if isUnlocked {
                Text("Unlocked")
            } else {
                Text("Locked")
            }
        }
        .onAppear(perform: authenticate)
    }
    
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "We need to unlock your data."
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, error in
                if success {
                    isUnlocked = true

                }
                else {
                    
                }
            }
        }
        else {
            
        }
    }
}

#Preview {
    BiometricsView()
}
