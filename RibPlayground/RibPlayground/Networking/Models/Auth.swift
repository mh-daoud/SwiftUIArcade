//
//  Auth.swift
//  RibPlayground
//
//  Created by SAIB on 11/02/1446 AH.
//

import Foundation


struct AuthRequst {
    let username: String
    let password: String
    let faceIdToken: String
    let payload: String
    let deviceId: String
}

struct AuthResponse: Codable {
    struct DataModel: Codable {
        
        struct Login: Codable {
            
            struct Result: Codable {
                let accessToken: AuthToken?
                let refreshToken: AuthToken?
            }
            
            let result: Result?
        }
        
        let login: Login?
    }
    
    let data: DataModel
}

struct AuthToken: Codable {
    let expiry: String?
    let token: String?
}
