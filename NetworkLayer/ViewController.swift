//
//  ViewController.swift
//  NetworkLayer
//
//  Created by sz ashik on 3/8/22.
//

import UIKit

class ViewController: UIViewController {
  var service: PopularMovieProviding = PopularMovieProvider(network: Networkable())

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    service.getPopularMovies{ result in
      switch result {
      case .success(let popularMovies):
        if let movies = popularMovies.movies {
          for movie in movies {
            print("name: \(movie.originalTitle ?? "not title")")
          }
        }
      case .failure(let error):
        print("Error: \(error.localizedDescription)")
      }
      
    }
  }


}

