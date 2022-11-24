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
    
    private let movieTypeUpcoming = MovieType(name: "Upcoming", id: 1)
    private let movieTypeTopRateMovie = MovieType(name: "Top Rate Movies", id: 2)
    private let movieTypePopularMovie = MovieType(name: "Popular Movies", id: 3)
    private let movieTypeLastestMovie = MovieType(name: "Lastest", id: 4)
    
    public init(movieApiRepository: MovieApiRepository, movieLocalRepository: MovieLocalRepository) {
        self.movieApiRepository = movieApiRepository
        self.movieLocalRepository = movieLocalRepository
    }
    
    public func getUpcomingMovies(completion: @escaping([Movie]?)->Void) {
        
        if(movieLocalRepository.isEmpty(movieType: movieTypeUpcoming)){
            movieApiRepository.getUpcomingMovies { movie in
                guard let movies = movie else { return }
                for movie in movies {
                    movieLocalRepository.saveMovies(movie: movie, typeMovie: movieTypeUpcoming)
                }
                completion(movie)
            }
        }else {
            movieLocalRepository.getUpcomingMovies(movieType: movieTypeUpcoming) { movie in
                completion(movie)
            }
        }
    }
    
    public func getTopRateMovies(completion: @escaping([Movie]?)->Void){
        if(movieLocalRepository.isEmpty(movieType: movieTypeTopRateMovie)) {
            movieApiRepository.getTopRateMovies { movie in
                guard let movies = movie else { return }
                for movie in movies {
                    movieLocalRepository.saveMovies(movie: movie, typeMovie: movieTypeTopRateMovie)
                }
                completion(movie)
            }
        }else {
            movieLocalRepository.getTopRateMovies(movieType: movieTypeTopRateMovie) { movie in
                completion(movie)
            }
        }
        
    }
    
    public func getPopularMovies(completion: @escaping([Movie]?)->Void){
        if(movieLocalRepository.isEmpty(movieType:movieTypePopularMovie )){
            movieApiRepository.getPopularMovies { movie in
                guard let movies = movie else { return }
                for movie in movies {
                    movieLocalRepository.saveMovies(movie: movie, typeMovie:movieTypePopularMovie )
                }
                completion(movie)
            }
        }else {
            movieLocalRepository.getPopularMovies(movieType: movieTypePopularMovie) { movie in
                completion(movie)
            }
        }
    }
    
    public func getLatestMovies(completion: @escaping([Movie]?)->Void){
        if(movieLocalRepository.isEmpty(movieType: movieTypeLastestMovie)){
            movieApiRepository.getLatestMovies { movie in
                guard let movies = movie else { return }
                for movie in movies {
                    movieLocalRepository.saveMovies(movie: movie, typeMovie:movieTypeLastestMovie )
                }
                completion(movie)
            }
        }else {
            movieLocalRepository.getLatestMovies(movieType: movieTypeLastestMovie) { movie in
                completion(movie)
            }
        }
    }
}
