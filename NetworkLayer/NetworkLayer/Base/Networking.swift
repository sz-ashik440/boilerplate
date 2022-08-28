//
//  Networking.swift
//  NetworkLayer
//
//  Created by sz ashik on 27/8/22.
//

import Foundation

class Networkable: Networking { }


protocol Networking {
  func fetch<T: Decodable>(_ requestProvider: RequestProviding, completion: @escaping (Result<T, Error>) -> Void)
}

extension Networking {
  func fetch<T: Decodable>(_ requestProvider: RequestProviding, completion: @escaping (Result<T, Error>) -> Void) {
    let urlRequest = requestProvider.urlRequest
    
    URLSession.shared.dataTask(with: urlRequest) { data, responnse, error in
      do {
        if let error = error {
          completion(.failure(error))
          return
        }
        guard let data = data else {
          preconditionFailure("No error was received but we also don't have data...")
        }
        
        let decodedObject = try JSONDecoder().decode(T.self, from: data)
        
        completion(.success(decodedObject))
      } catch {
        completion(.failure(error))
      }
    }.resume()
  }
}
