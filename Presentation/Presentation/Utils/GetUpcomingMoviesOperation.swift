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
    
    private var movieProxy: MovieProxy?
    private let movieTypeUpcoming = MovieType(name: "Upcoming", id: 1)
    
    init(movieProxy: MovieProxy, completion: @escaping([Domain.Movie]?)->Void) {
        self.movieProxy = movieProxy
        
        movieProxy.getAllMovies(movieType: movieTypeUpcoming) { movie in
            completion(movie)
        }
        
    }
    
    
}
