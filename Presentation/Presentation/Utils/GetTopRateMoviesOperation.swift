//
//  getTopRateMoviesOperation.swift
//  Presentation
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 17/11/22.
//

import UIKit
import Domain
import Infraestructure

class GetTopRateMoviesOperation: Operation {
    
    private let movieService: MovieService?
    private let movieTypeTopRateMovie = MovieType(name: "Top Rate Movies", id: 2)

    init(movieService: MovieService, completion: @escaping([Domain.Movie]?)->Void) {
        self.movieService = movieService
        
        movieService.getMovie(movieType: movieTypeTopRateMovie) { movie, error in
            completion(movie)
        }
        
    }
  
    
    
}
