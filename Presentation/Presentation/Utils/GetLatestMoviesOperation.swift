//
//  GetLatestMoviesOperation.swift
//  Presentation
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 17/11/22.
//

import Foundation
import Domain

class GetLatestMoviesOperation: Operation {
    private var movieService: MovieService?
    
    init(movieService: MovieService, completion: @escaping([Movie]?)->Void) {
        self.movieService = movieService
        
        movieService.getLatestMovies { movie in
            completion(movie)
        }
        
    }
}
