//
//  MoviesEndpoint.swift
//  NetworkLayer
//
//  Created by sz ashik on 31/8/22.
//

import Foundation

enum MoviesEndpoint {
  case topRated
  case movieDetail(id: Int)
}

extension MoviesEndpoint: Endpoint {
  var path: String {
    switch self {
    case .topRated:
       return "/3/movie/top_rated"
    case .movieDetail(let id):
      return "/3/movie/\(id)"
    }
  }
  
  var method: RequestMethod {
    switch self {
    case .topRated, .movieDetail:
      return .get
    }
  }
  
  var header: [String : String]? {
    switch self {
    case .topRated, .movieDetail:
      return nil
    }
  }
  
  var queryItems: [URLQueryItem] {
    let token = "7749d2bb97d5980407ee7ad977e7dd02"
    switch self {
    case .topRated, .movieDetail:
      return [URLQueryItem(name: "api_key", value: token)]
    }
  }
  
  var body: [String : String]? {
    switch self {
    case .topRated, .movieDetail:
      return nil
    }
  }
}
