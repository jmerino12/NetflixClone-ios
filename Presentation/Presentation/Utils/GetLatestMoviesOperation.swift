//
//  GetLatestMoviesOperation.swift
//  Presentation
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 17/11/22.
//

import Foundation
import Domain
import Infraestructure

class GetLatestMoviesOperation: Operation {
    
    private let movieService: MovieService?
    private let movieTypeLastestMovie = MovieType(name: "Lastest", id: 4)
    
    init(movieService: MovieService, completion: @escaping([Domain.Movie]?)->Void) {
        self.movieService = movieService
        
        movieService.getMovie(movieType: movieTypeLastestMovie) { movie in
            completion(movie)
        }
        
    }
}
