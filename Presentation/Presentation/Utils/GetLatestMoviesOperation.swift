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
    private var movieProxy: MovieProxy?
    private let movieTypeLastestMovie = MovieType(name: "Lastest", id: 4)
    
    init(movieProxy: MovieProxy, completion: @escaping([Domain.Movie]?)->Void) {
        self.movieProxy = movieProxy
        
        movieProxy.getAllMovies(movieType: movieTypeLastestMovie) { movie in
            completion(movie)
        }
        
    }
}
