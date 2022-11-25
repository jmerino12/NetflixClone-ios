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
    private let movieTypeUpcoming = MovieType(name: "Upcoming", id: 1)
    
    init(movieService: MovieService, completion: @escaping([Movie]?)->Void) {
        self.movieService = movieService
        
        movieService.getUpcomingMovies(movieType: movieTypeUpcoming) { movie in
            completion(movie)
        }
        
    }
    
    
}
