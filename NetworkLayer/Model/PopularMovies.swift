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

// MARK: - Result
struct Movie: Codable {
//  "adult": false,
//  "backdrop_path": "/vvObT0eIWGlArLQx3K5wZ0uT812.jpg",
//  "genre_ids": [
//      28,
//      12,
//      14
//  ],
//  "id": 616037,
//  "original_language": "en",
//  "original_title": "Thor: Love and Thunder",
//  "overview": "After his retirement is interrupted by Gorr the God Butcher, a galactic killer who seeks the extinction of the gods, Thor Odinson enlists the help of King Valkyrie, Korg, and ex-girlfriend Jane Foster, who now inexplicably wields Mjolnir as the Relatively Mighty Girl Thor. Together they embark upon a harrowing cosmic adventure to uncover the mystery of the God Butcher’s vengeance and stop him before it’s too late.",
//  "popularity": 6771.083,
//  "poster_path": "/pIkRyD18kl4FhoCNQuWxWu5cBLM.jpg",
//  "release_date": "2022-07-06",
//  "title": "Thor: Love and Thunder",
//  "video": false,
//  "vote_average": 6.8,
//  "vote_count": 2045
  
//  let adult: Bool?
//  let backdropPath: String?
//  let genreIDS: [Int]?
//  let id: Int?
  let originalTitle: String?
//  let originalLanguage, originalTitle, overview: String?
//  let popularity: Double?
//  let posterPath, releaseDate, title: String?
//  let video: Bool?
//  let voteAverage: Double?
//  let voteCount: Int?
  
  private enum CodingKeys : String, CodingKey {
    case originalTitle = "original_title"
  }
  
//  init(from decoder: Decoder) throws {
//    let values = try decoder.container(keyedBy: CodingKeys.self)
//    originalTitle = try values.decode(String.self, forKey: .originalTitle)
//  }
  
  
  
}
