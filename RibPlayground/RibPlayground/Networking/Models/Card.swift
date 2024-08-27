//
//  Card.swift
//  RibPlayground
//
//  Created by SAIB on 14/02/1446 AH.
//

import Foundation


struct CardResponse: Codable {
    
    struct DataModel: Codable {
        
        struct User: Codable {
            
            struct Account: Codable {
                
                struct MadaCard: Codable {
                    let accountNumber: String?
                    let embossedName: String?
                    let maskedNumber: String?
                    let status:  String?
                    let category: String?
                    let token: String?
                    let expiry: String?
                }
                
                let madaCards: [MadaCard]?
            }
            
            let accounts: [Account]?
        }
        
        let user: User?
    }
    
    let data: DataModel
}
