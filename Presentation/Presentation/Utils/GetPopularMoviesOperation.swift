//
//  GetPopularMoviesOperation.swift
//  Presentation
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 17/11/22.
//

import Foundation
import Domain
import Infraestructure

class GetPopularMoviesOperation: Operation {
    
    private let movieService: MovieService?
    private let movieTypePopularMovie = MovieType(name: "Popular Movies", id: 3)

    
    init(movieService: MovieService, completion: @escaping([Domain.Movie]?)->Void) {
        self.movieService = movieService
        
        movieService.getMovie(movieType: movieTypePopularMovie) { movie, error in
            completion(movie)
        }
        
    }
}
