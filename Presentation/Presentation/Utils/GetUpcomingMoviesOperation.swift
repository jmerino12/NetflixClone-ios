//
//  UpcomingMovieOperation.swift
//  Presentation
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 16/11/22.
//

import UIKit
import Domain


class GetUpcomingMoviesOperation: Operation {
    
    private var movieService: MovieService?
    
    
    init(movieService: MovieService, completion: @escaping([Movie]?)->Void) {
        self.movieService = movieService
        
        movieService.getUpcomingMovies { movie in
            completion(movie)
        }
        
    }
    
    
}
