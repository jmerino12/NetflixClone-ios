//
//  MovieProxy.swift
//  Infraestructure
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 29/11/22.
//

import Foundation
import Domain

public class MovieProxy: MovieRepository {
    
    
    private let movieApiRepository: MovieApiRepository
    private let movieLocalRepository: MovieLocalRepository
    
    public init(movieApiRepository: MovieApiRepository, movieLocalRepository: MovieLocalRepository) {
        self.movieApiRepository = movieApiRepository
        self.movieLocalRepository = movieLocalRepository
    }
    
    public func getAllMovies(movieType: Domain.MovieType, completion: @escaping ([Domain.Movie]?, _ error: RuntimeError?) -> Void) {
        if(movieLocalRepository.isEmpty(movieType: movieType) || movieLocalRepository.isMovieSavedMoreThan24Hours()){
            try! movieApiRepository.getMovies(movieType: movieType) { movie, error in
                if error != nil {
                    completion(nil, error)
                    return
                }
                guard let movies = movie else { return }
                self.movieLocalRepository.clearDB(movieType: movieType)
                for movie in movies {
                    self.movieLocalRepository.saveMovies(movie: movie, typeMovie: movieType)
                }
                self.movieLocalRepository.saveDate()
                completion(movie, nil)
            }
        }else {
            movieLocalRepository.getMovieFor(movieType: movieType) { movie in
                completion(movie, nil)
            }
        }
    }
}
