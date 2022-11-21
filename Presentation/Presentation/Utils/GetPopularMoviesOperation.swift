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
    
    init(movieService: MovieService, completion: @escaping([Movie]?)->Void) {
        self.movieService = movieService
        
        movieService.getPopularMovies { movie in
            completion(movie)
        }
        
    }
}
