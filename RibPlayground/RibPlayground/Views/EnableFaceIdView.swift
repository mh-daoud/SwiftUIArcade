//
//  EnableFaceIdView.swift
//  RibPlayground
//
//  Created by SAIB on 10/02/1446 AH.
//

import SwiftUI

struct EnableFaceIdView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack(spacing: 0) {
            
            Spacer()
            
            Image(.saibLogo)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 65)
                .padding(18)
                .background {
                    Color(.offWhite)
                }
                .clipShape(.buttonBorder)
                .shadow(color: .shadow, radius: 5)
                
            
            Spacer()
                .frame(height: 48)
            
            Text("Face ID or passcode is not set up")
                .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                .multilineTextAlignment(.center)
                .font(.system(size: 26, weight: .bold))
                .foregroundStyle(.black)
            
            Spacer()
                .frame(height: 8)
            
            Text("Set up Face ID or passcode in your SAIB profile settings and try again.")
                .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                .multilineTextAlignment(.center)
                .font(.system(size: 16))
                .foregroundStyle(.black)
            
            Spacer()
            
            Button("Got it") {
                dismiss()
            }
            .padding(EdgeInsets(top: 14, leading: 20, bottom: 14, trailing: 20))
            .frame(maxWidth: .infinity)
            .background {
                Color(.link)
            }
            .foregroundStyle(.white)
            .clipShape(.buttonBorder)
            
            Spacer()
                .frame(height: 20)
        }
        .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
    }
}

#Preview {
    EnableFaceIdView()
}
