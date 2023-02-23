//
//  CoreService.swift
//  TheBookGallery
//
//  Created by Kaan Yeyrek on 2/4/23.
//

import Foundation

protocol CoreServiceInterface {
    func fetch<T: Decodable>(endPoint: HTTPEndpoint, completion: @escaping (Result<T, NetworkError>) -> Void)
}

class CoreService: CoreServiceInterface {
    
    func fetch<T>(endPoint: HTTPEndpoint, completion: @escaping (Result<T, NetworkError>) -> Void) where T : Decodable {
        var urlComponents = URLComponents()
        urlComponents.scheme = endPoint.scheme
        urlComponents.host = endPoint.host
        urlComponents.path = endPoint.path
        urlComponents.queryItems = endPoint.query
        
        guard let url = urlComponents.url else { return
            completion(.failure(.badURL))
        }
        print(url)
        var request = URLRequest(url: url)
        request.httpMethod = endPoint.method.rawValue
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if error != nil {
                completion(.failure(.badURL))
            }
            guard let response = response as? HTTPURLResponse else {
                return completion(.failure(.badResponse))
            }
            guard let data = data else {
                return completion(.failure(.badData))
            }
            
            switch response.statusCode {
            case 200...299:
                do {
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .iso8601
                    let decodedData = try decoder.decode(T.self, from: data)
                    completion(.success(decodedData))
                } catch {
                    print(error)
                    completion(.failure(.decoding))
                }
                default:
                    print(response.statusCode)
                    completion(.failure(.unexpectedStatusCode))
            }
        }.resume()
    }
}
