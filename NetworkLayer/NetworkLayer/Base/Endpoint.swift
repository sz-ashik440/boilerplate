//
//  Endpoint.swift
//  NetworkLayer
//
//  Created by sz ashik on 27/8/22.
//

import Foundation

protocol RequestProviding {
  var urlRequest: URLRequest{ get }
}



enum Endpoint {
  case feed
  case popularMovies
}

extension Endpoint: RequestProviding {
  var urlRequest: URLRequest {
    switch self {
    case .feed:
      guard let url = URL(string: "https://mydomain.com/feed") else {
        preconditionFailure("Invalid URL used to create URL instance")
      }
      return URLRequest(url: url)
    case .popularMovies:
      guard let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=7749d2bb97d5980407ee7ad977e7dd02&language=en-US&page=1") else {
        preconditionFailure("Invalid URL used to create URL instance")
      }
      return URLRequest(url: url)
    }
  }
}
