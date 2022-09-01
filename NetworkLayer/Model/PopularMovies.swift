//
//  PopularMovies.swift
//  NetworkLayer
//
//  Created by sz ashik on 27/8/22.
//

import Foundation
struct PopularMovies: Codable {
  let page: Int?
  let movies: [Movie]?
  let totalPages, totalResults: Int?
  
  private enum CodingKeys : String, CodingKey {
    case page
    case movies = "results"
    case totalPages = "total_pages"
    case totalResults = "total_results"
  }
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    page = try values.decode(Int.self, forKey: .page)
    totalPages = try values.decode(Int.self, forKey: .totalPages)
    totalResults = try values.decode(Int.self, forKey: .totalResults)
    movies = try values.decode([Movie].self, forKey: .movies)
  }
  
  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(page, forKey: .page)
    try container.encode(totalPages, forKey: .totalPages)
    try container.encode(totalResults, forKey: .totalResults)
    try container.encode(movies, forKey: .movies)
  }
  
  
}
