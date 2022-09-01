//
//  Services.swift
//  NetworkLayer
//
//  Created by sz ashik on 31/8/22.
//

import Foundation

protocol MoviesServiceable {
  func getTopRated() async -> Result<TopRatedMovies, RequestError>
  func getMovieDetail(id: Int) async -> Result<Movie, RequestError>
}

struct MoviesService: HTTPClient, MoviesServiceable {
  func getTopRated() async -> Result<TopRatedMovies, RequestError> {
    return await sendRequest(endpoint: MoviesEndpoint.topRated, responseModel: TopRatedMovies.self)
  }
  
  func getMovieDetail(id: Int) async -> Result<Movie, RequestError> {
    return await sendRequest(endpoint: MoviesEndpoint.movieDetail(id: id), responseModel: Movie.self)
  }
}
