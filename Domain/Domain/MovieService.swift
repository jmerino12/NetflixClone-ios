//
//  MovieService.swift
//  Domain
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 20/10/22.
//

import Foundation

public struct MovieService {
    let movieApiRepository: MovieApiRepository
    let movieLocalRepository: MovieLocalRepository
    
    public init(movieApiRepository: MovieApiRepository, movieLocalRepository: MovieLocalRepository) {
        self.movieApiRepository = movieApiRepository
        self.movieLocalRepository = movieLocalRepository
    }
    
    public func getUpcomingMovies(completion: @escaping([Movie]?)->Void) {
        if(movieLocalRepository.isEmpty(type: "1")){
            movieApiRepository.getUpcomingMovies { movie in
                guard let movies = movie else { return }
                for movie in movies {
                    movieLocalRepository.saveMovies(movie: movie, typeMovie: "1")
                }
                completion(movie)
            }
        }else {
            movieLocalRepository.getUpcomingMovies { movie in
                completion(movie)
            }
        }
    }
    
    public func getTopRateMovies(completion: @escaping([Movie]?)->Void){
        if(movieLocalRepository.isEmpty(type: "2")){
            movieApiRepository.getTopRateMovies { movie in
                guard let movies = movie else { return }
                for movie in movies {
                    movieLocalRepository.saveMovies(movie: movie, typeMovie: "2")
                }
                completion(movie)
            }
        }else {
            movieLocalRepository.getTopRateMovies { movie in
                completion(movie)
            }
        }
    
    }
    
    public func getPopularMovies(completion: @escaping([Movie]?)->Void){
        if(movieLocalRepository.isEmpty(type: "3")){
            movieApiRepository.getPopularMovies { movie in
                guard let movies = movie else { return }
                for movie in movies {
                    movieLocalRepository.saveMovies(movie: movie, typeMovie: "3")
                }
                completion(movie)
            }
        }else {
            movieLocalRepository.getPopularMovies { movie in
                completion(movie)
            }
        }
    }
    
    public func getLatestMovies(completion: @escaping([Movie]?)->Void){
        if(movieLocalRepository.isEmpty(type: "4")){
            movieApiRepository.getLatestMovies { movie in
                guard let movies = movie else { return }
                for movie in movies {
                    movieLocalRepository.saveMovies(movie: movie, typeMovie: "4")
                }
                completion(movie)
            }
        }else {
            movieLocalRepository.getLatestMovies { movie in
                completion(movie)
            }
        }
    }
}
