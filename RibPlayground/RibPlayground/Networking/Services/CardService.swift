//
//  UserService.swift
//  RibPlayground
//
//  Created by SAIB on 10/02/1446 AH.
//

import Foundation


class CardService {
    
    let networkManager: NetworkManagerProtocol
    
    init(networkManager: NetworkManagerProtocol = NetworkManager.shared) {
        self.networkManager = networkManager
    }
    
    func getCards(completion: @escaping (Result<CardResponse, Error>) -> Void) {
        networkManager.request(endpoint: .getCards) { result in
            switch result {
            case .success(let data):
                do {
                    let cardResponse = try JSONDecoder().decode(CardResponse.self, from: data)
                    completion(.success(cardResponse))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
