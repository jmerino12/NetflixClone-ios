//
//  MovieService.swift
//  Domain
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 20/10/22.
//

import Foundation

public struct MovieService {
    private let movieApiRepository: MovieApiRepository
    private let movieLocalRepository: MovieLocalRepository
    
    
    public init(movieApiRepository: MovieApiRepository, movieLocalRepository: MovieLocalRepository) {
        self.movieApiRepository = movieApiRepository
        self.movieLocalRepository = movieLocalRepository
    }
    
    public func getUpcomingMovies(movieType: MovieType, completion: @escaping([Movie]?)->Void) {
        
        if(movieLocalRepository.isEmpty(movieType: movieType)){
            movieApiRepository.getUpcomingMovies { movie in
                guard let movies = movie else { return }
                for movie in movies {
                    movieLocalRepository.saveMovies(movie: movie, typeMovie: movieType)
                }
                completion(movie)
            }
        }else {
            movieLocalRepository.getUpcomingMovies(movieType: movieType) { movie in
                completion(movie)
            }
        }
    }
    
    public func getTopRateMovies(movieType: MovieType, completion: @escaping([Movie]?)->Void){
        if(movieLocalRepository.isEmpty(movieType: movieType)) {
            movieApiRepository.getTopRateMovies { movie in
                guard let movies = movie else { return }
                for movie in movies {
                    movieLocalRepository.saveMovies(movie: movie, typeMovie: movieType)
                }
                completion(movie)
            }
        }else {
            movieLocalRepository.getTopRateMovies(movieType: movieType) { movie in
                completion(movie)
            }
        }
        
    }
    
    public func getPopularMovies(movieType: MovieType, completion: @escaping([Movie]?)->Void){
        if(movieLocalRepository.isEmpty(movieType: movieType )){
            movieApiRepository.getPopularMovies { movie in
                guard let movies = movie else { return }
                for movie in movies {
                    movieLocalRepository.saveMovies(movie: movie, typeMovie: movieType )
                }
                completion(movie)
            }
        }else {
            movieLocalRepository.getPopularMovies(movieType: movieType) { movie in
                completion(movie)
            }
        }
    }
    
    public func getLatestMovies(movieType: MovieType, completion: @escaping([Movie]?)->Void){
        if(movieLocalRepository.isEmpty(movieType: movieType)){
            movieApiRepository.getLatestMovies { movie in
                guard let movies = movie else { return }
                for movie in movies {
                    movieLocalRepository.saveMovies(movie: movie, typeMovie: movieType )
                }
                completion(movie)
            }
        }else {
            movieLocalRepository.getLatestMovies(movieType: movieType) { movie in
                completion(movie)
            }
        }
    }
}
