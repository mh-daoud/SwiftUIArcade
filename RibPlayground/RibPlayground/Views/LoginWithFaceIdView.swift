//
//  LoginWithFaceIdView.swift
//  RibPlayground
//
//  Created by SAIB on 10/02/1446 AH.
//

import SwiftUI

struct LoginWithFaceIdView: View {
    
    var onTapped: (() -> Void)?
    
    var body: some View {
        Button(action: {
            onTapped?()
        }, label: {
            VStack {
                Text("Login using Face ID")
                    .foregroundStyle(.black)
                Image(systemName: "faceid")
                    .padding(.init(top: 4, leading: 0, bottom: 0, trailing: 0))
                    .font(.system(size: 64, weight: .ultraLight))
                    .foregroundStyle(.link)
            }
            
        })
        .padding(.init(top: 24, leading: 0, bottom: 0, trailing: 0))
    }
    
}

#Preview {
    LoginWithFaceIdView()
}
