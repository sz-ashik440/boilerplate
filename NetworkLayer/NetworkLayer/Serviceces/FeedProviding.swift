//
//  FeedProviding.swift
//  NetworkLayer
//
//  Created by sz ashik on 27/8/22.
//

import Foundation

class Feed: Codable { }

protocol FeedProviding{
  var network: Networking { get }
  func getFeed(_ completion: @escaping(Result<Feed, Error>) -> Void)
}

extension FeedProviding {
  func getFeed(_ completion: @escaping(Result<Feed, Error>) -> Void) {
    network.fetch(Endpoint.feed, completion:  completion)
  }
}

