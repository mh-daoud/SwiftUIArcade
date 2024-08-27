//
//  ContentView.swift
//  RibPlayground
//
//  Created by SAIB on 10/02/1446 AH.
//

import SwiftUI

struct ContentView: View {
    @State var isFaceLoginEnabled = true
    @State var isLoading = true
    let authService = AuthService()
    let cardService = CardService()
    
    var body: some View {
        ZStack {
            Color(.white)
                .ignoresSafeArea()
            VStack (spacing: 0) {
                
                if isFaceLoginEnabled {
                    Spacer()
                    LoginWithFaceIdView(onTapped: onTapped)
                    Spacer()
                    LoadingView()
                        .opacity(isLoading ? 1 : 0)
                    Spacer()
                    Spacer()
                } else {
                    EnableFaceIdView()
                }
            }
            
        }
    }
    
    func onTapped() {
        isLoading = true
        let biometricEnabled: Bool? = KeychainUtil.shared.getItem(key: .enabledBiometricLogin)
        let deviceId: String = KeychainUtil.shared.getItem(key: .deviceId) ?? "rib_test_device"
        let user: WalletExtensionUser? = KeychainUtil.shared.getItem(key: .walletExtensionUser)
        guard let user, let biometricEnabled else {
            return
        }
        let userDicit = [
            "userId": user.userId,
            "deviceId": deviceId
        ]
        
        guard let payloadData = try? JSONEncoder().encode(userDicit), let payloadString = String(data: payloadData, encoding: .utf8), let signature = KeychainUtil.shared.signPayload(payload: payloadString, promptMessage: "Login please yay!") else {
            return
        }
        
        NetworkManager.shared.configureRequestHeaders(headers: [
            "x-ibm-client-id":user.clientId ?? "",
            "x-ibm-client-secret":user.clientSecret ?? ""])
        
        let request = AuthRequst(
            username: user.username ?? "",
            password: user.password ?? "",
            faceIdToken: signature,
            payload: payloadString,
            deviceId: deviceId)
        authService.authenticateUser(
            request: request
        ) { result in
            switch result {
            case .success(let authResponse):
                if let token = authResponse.data.login?.result?.accessToken?.token {
                    NetworkManager.shared.addAuthorizationHeader(token: token)
                    cardService.getCards { cardResult in
                        switch cardResult {
                        case let .success(cardResponse):
                            print("card response \(cardResponse)")
                        case .failure(_):
                            print("error")
                        }
                    }
                }
            case .failure(_):
                print("error")
            }
        }
    }
}

#Preview {
    ContentView()
}
