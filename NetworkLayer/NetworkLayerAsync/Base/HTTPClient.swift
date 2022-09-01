//
//  HTTPClient.swift
//  NetworkLayer
//
//  Created by sz ashik on 31/8/22.
//

import Foundation

protocol HTTPClient {
  func sendRequest<T: Decodable>(endpoint: Endpoint, responseModel: T.Type) async -> Result<T, RequestError>
}

extension HTTPClient {
  func sendRequest<T: Decodable>(endpoint: Endpoint, responseModel: T.Type) async -> Result<T, RequestError> {
    var urlComponents = URLComponents()
    urlComponents.scheme = endpoint.scheme
    urlComponents.host = endpoint.host
    urlComponents.path = endpoint.path
    urlComponents.queryItems = endpoint.queryItems
    
    guard let url = urlComponents.url else { return .failure(.invalidURL)}
    
    var request = URLRequest(url: url)
    request.httpMethod = endpoint.method.rawValue
    request.allHTTPHeaderFields = endpoint.header
    
    if let body = endpoint.body {
      request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
    }
    
    do {
//      let (data, response) = try await URLSession.shared.data(for: request, delegate: nil)
      let (data, response) = try await URLSession.shared.data(from: url)
      guard let response = response as? HTTPURLResponse else { return .failure(.noResponse) }
      
      switch response.statusCode {
      case 200...299:
        guard let decodedResponse = try? JSONDecoder().decode(responseModel.self, from: data) else {
          return .failure(.decode)
        }
        return .success(decodedResponse)
      case 401:
        return .failure(.unAuthorized)
      default:
        return .failure(.unExpectedStatusCode)
      }
    } catch {
      return .failure(.unknown)
    }
  }
}

@available(iOS, deprecated: 15.0, message: "Use the built-in API Instead")
extension URLSession {
  func data(from url: URL) async throws -> (Data, URLResponse) {
    try await withCheckedThrowingContinuation { continuation in
      let task = self.dataTask(with: url) { data, response, error in
        guard let data = data, let response = response else {
          let error = error ?? URLError(.badServerResponse)
          return continuation.resume(throwing: error)
        }
        
        continuation.resume(returning: (data, response))
      }
      
      task.resume()
    }
  }
}
