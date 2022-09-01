//
//  ViewController.swift
//  NetworkLayer
//
//  Created by sz ashik on 3/8/22.
//

import UIKit

class ViewController: UIViewController {
//  var service: PopularMovieProviding = PopularMovieProvider(network: Networkable())
  var service: MoviesServiceable = MoviesService()
  

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
//    service.getPopularMovies{ result in
//      switch result {
//      case .success(let popularMovies):
//        if let movies = popularMovies.movies {
//          for movie in movies {
//            print("name: \(movie.originalTitle ?? "not title")")
//          }
//        }
//      case .failure(let error):
//        print("Error: \(error.localizedDescription)")
//      }
//      
//    }
    
    
    Task {
      let result = await service.getTopRated()
      switch result {
      case .success(let topMovies):
        for movie in topMovies.results {
          print(movie.title)
        }
      case .failure(let error):
        print("Error: \(error.customMessage)")
      }
    }
  }
}


protocol Flyer {
  func fly()
}

extension Flyer {
  func fly() {
    print("I can fly")
  }
}

class Bee: Flyer {
  func bizz() {
    print("Bizz")
  }
}
