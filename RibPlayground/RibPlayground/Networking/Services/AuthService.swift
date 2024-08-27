//
//  UserService.swift
//  RibPlayground
//
//  Created by SAIB on 10/02/1446 AH.
//

import Foundation


class AuthService {
    
    let networkManager: NetworkManagerProtocol
    
    init(networkManager: NetworkManagerProtocol = NetworkManager.shared) {
        self.networkManager = networkManager
    }
    
    func authenticateUser(request: AuthRequst, completion: @escaping (Result<AuthResponse, Error>) -> Void) {
        networkManager.request(endpoint: .authenticateUser(request)) { result in
            switch result {
            case .success(let data):
                do {
                    
                    let authResponse = try JSONDecoder().decode(AuthResponse.self, from: data)
                    completion(.success(authResponse))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
