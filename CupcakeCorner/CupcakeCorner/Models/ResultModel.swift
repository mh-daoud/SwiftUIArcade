//
//  ResultModel.swift
//  CupcakeCorner
//
//  Created by Mac on 15/03/2024.
//

import Foundation

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}
