//
//  getTopRateMoviesOperation.swift
//  Presentation
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 17/11/22.
//

import UIKit
import Domain

class GetTopRateMoviesOperation: Operation {
    
    private var movieService: MovieService?
    private let movieTypeTopRateMovie = MovieType(name: "Top Rate Movies", id: 2)

    init(movieService: MovieService, completion: @escaping([Movie]?)->Void) {
        self.movieService = movieService
        
        movieService.getTopRateMovies(movieType: movieTypeTopRateMovie) { movie in
            completion(movie)
        }
        
    }
  
    
    
}
