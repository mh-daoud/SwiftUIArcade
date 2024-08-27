//
//  WalletExtensionUser.swift
//  RibPlayground
//
//  Created by SAIB on 11/02/1446 AH.
//

import Foundation


struct WalletExtensionUser : Codable {
    let username: String?
    let password: String?
    let userId: String?
    let clientId: String?
    let clientSecret: String?
    
    enum CodingKeys: String, CodingKey {
        case username
        case password
        case userId
        
        case clientId = "X-IBM-Client-Id"
        case clientSecret = "X-IBM-Client-Secret"
      }
}
