//
//  UpcomingMovieOperation.swift
//  Presentation
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 16/11/22.
//

import UIKit
import Domain
import Infraestructure


class GetUpcomingMoviesOperation: Operation {
    
    private let movieService: MovieService?
    private let movieTypeUpcoming = MovieType(name: "Upcoming", id: 1)
    
    init(movieService: MovieService, completion: @escaping([Domain.Movie]?)->Void) {
        self.movieService = movieService
        
        movieService.getMovie(movieType: movieTypeUpcoming) { movie, error in
            completion(movie)
        }        
    }
    
    
}
