//
//  User.swift
//  CupcakeCorner
//
//  Created by Mac on 15/03/2024.
//

import Foundation

@Observable
class User: Codable {
    var name = "Taylor"
    
    enum CodingKeys: String, CodingKey {
        case _name = "name"
    }
}
