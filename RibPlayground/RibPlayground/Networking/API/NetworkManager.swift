//
//  NetworkManager.swift
//  RibPlayground
//
//  Created by SAIB on 10/02/1446 AH.
//

import Foundation

protocol NetworkManagerProtocol {
    func request(endpoint: APIEndpoint, completion: @escaping (Result<Data, Error>) -> Void)
    func configureRequestHeaders(headers: [String: Any])
    func addAuthorizationHeader(token: String)
}

class NetworkManager: NetworkManagerProtocol {
    static let shared = NetworkManager()
    
    private init() {}
    
    let configuration = URLSessionConfiguration.default
    var baseURL: String {
        return Bundle.main.object(forInfoDictionaryKey: "API_BASE_URL") as? String ?? ""
    }
    
    func configureRequestHeaders(headers: [String: Any])  {
        configuration.httpAdditionalHeaders = headers
    }
    
    func addAuthorizationHeader(token: String) {
        configuration.httpAdditionalHeaders?.updateValue("bearer \(token)", forKey: "authorization")
    }
    
    func request(endpoint: APIEndpoint, completion: @escaping (Result<Data, Error>) -> Void) {
        let urlString = baseURL //+ endpoint.path
        
        guard let url = URL(string: urlString) else {
            completion(.failure(APIError.invalidURL))
            return
        }
                
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method
        
        if let parameters = endpoint.parameters {
            request.httpBody = try? JSONSerialization.data(withJSONObject: parameters)
            request.setValue("application/json", forHTTPHeaderField: "content-type")
        }
        
        let session = URLSession(configuration: configuration)
        
        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            if let data = data {
                completion(.success(data))
            }
        }
        task.resume()
    }
}
