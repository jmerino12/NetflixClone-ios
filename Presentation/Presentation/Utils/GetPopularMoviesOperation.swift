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
    
    private let movieProxy: MovieProxy?
    private let movieTypePopularMovie = MovieType(name: "Popular Movies", id: 3)

    
    init(movieProxy: MovieProxy, completion: @escaping([Domain.Movie]?)->Void) {
        self.movieProxy = movieProxy
        
        movieProxy.getAllMovies(movieType: movieTypePopularMovie) { movie in
            completion(movie)
        }
        
    }
}
