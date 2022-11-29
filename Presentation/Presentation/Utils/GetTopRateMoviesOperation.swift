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
    
    private let movieProxy: MovieProxy?
    private let movieTypeTopRateMovie = MovieType(name: "Top Rate Movies", id: 2)

    init(movieProxy: MovieProxy, completion: @escaping([Domain.Movie]?)->Void) {
        self.movieProxy = movieProxy
        
        movieProxy.getAllMovies(movieType: movieTypeTopRateMovie) { movie in
            completion(movie)
        }
        
    }
  
    
    
}
