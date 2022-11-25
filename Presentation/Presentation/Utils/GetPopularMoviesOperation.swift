//
//  GetPopularMoviesOperation.swift
//  Presentation
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 17/11/22.
//

import Foundation
import Domain

class GetPopularMoviesOperation: Operation {
    
    private var movieService: MovieService?
    private let movieTypePopularMovie = MovieType(name: "Popular Movies", id: 3)

    
    init(movieService: MovieService, completion: @escaping([Movie]?)->Void) {
        self.movieService = movieService
        
        movieService.getPopularMovies(movieType: movieTypePopularMovie) { movie in
            completion(movie)
        }
        
    }
}
