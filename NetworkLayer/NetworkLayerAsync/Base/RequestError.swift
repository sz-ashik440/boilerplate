//
//  RequestError.swift
//  NetworkLayer
//
//  Created by sz ashik on 31/8/22.
//

import Foundation

enum RequestError: Error {
  case decode
  case invalidURL
  case noResponse
  case unAuthorized
  case unExpectedStatusCode
  case unknown
  
  var customMessage: String {
    switch self {
    case .decode:
      return "Decode error"
    case .invalidURL:
      return "Invalid url"
    case .noResponse:
      return "Empty response"
    case .unAuthorized:
      return "Un-Authorized user"
    case .unExpectedStatusCode:
      return "Un-expected status code"
    case .unknown:
      return "Unknow  error"
    }
  }
}
