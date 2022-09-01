//
//  TopRatedMovies.swift
//  NetworkLayer
//
//  Created by sz ashik on 31/8/22.
//

import Foundation
struct TopRatedMovies: Codable {
  let page: Int
  let totalPages: Int
  let totalResults: Int
  let results: [Movie]
  
  enum CodingKeys: String, CodingKey {
    case page
    case results
    case totalPages = "total_pages"
    case totalResults = "total_results"
  }
}
