//
//  APIError.swift
//  RibPlayground
//
//  Created by SAIB on 10/02/1446 AH.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case noData
    case decodingError
    case serverError
}
