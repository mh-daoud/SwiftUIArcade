//
//  LoadingView.swift
//  RibPlayground
//
//  Created by SAIB on 23/02/1446 AH.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            Image(.saibLogo)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 65)
            Text("Authenticating...")
                .font(.system(size: 16))
                .foregroundStyle(.black)
                .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
        }
    }
}

#Preview {
    LoadingView()
        .previewLayout(.sizeThatFits)
}

struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        LoadingView().previewLayout(.sizeThatFits)
    }
}
