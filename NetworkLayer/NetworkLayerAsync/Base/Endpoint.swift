//
//  Endpoint.swift
//  NetworkLayer
//
//  Created by sz ashik on 31/8/22.
//

import Foundation

protocol Endpoint {
  var scheme: String { get }
  var host: String { get }
  var path: String { get }
  var method: RequestMethod { get }
  var header: [String: String]? { get }
  
  var queryItems: [URLQueryItem] { get }
  
  var body: [String: String]? { get }
}

extension Endpoint {
  var scheme: String {
    return "https"
  }
  var host: String {
    return "api.themoviedb.org"
  }
}
