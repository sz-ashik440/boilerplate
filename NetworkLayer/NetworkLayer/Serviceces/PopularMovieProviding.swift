//
//  PopularMovieProviding.swift
//  NetworkLayer
//
//  Created by sz ashik on 27/8/22.
//

import Foundation
protocol PopularMovieProviding{
  var network: Networking { get }
  func getPopularMovies(_ completion: @escaping(Result<PopularMovies, Error>) -> Void)
}

extension PopularMovieProviding {
  func getPopularMovies(_ completion: @escaping(Result<PopularMovies, Error>) -> Void) {
    network.fetch(Endpoint.popularMovies, completion:  completion)
  }
}

class PopularMovieProvider: PopularMovieProviding {
  var network: Networking
  init(network: Networking) {
    self.network = network
  }
}



