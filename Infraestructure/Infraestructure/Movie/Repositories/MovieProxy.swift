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
    
    public func getAllMovies(movieType: Domain.MovieType, completion: @escaping ([Domain.Movie]?) -> Void) {
        if(movieLocalRepository.isEmpty(movieType: movieType)){
           try! movieApiRepository.getMovies(movieType: movieType) { movie in
                guard let movies = movie else { return }
                for movie in movies {
                    self.movieLocalRepository.saveMovies(movie: movie, typeMovie: movieType)
                }
                completion(movie)
            }
        }else {
            movieLocalRepository.getMovieFor(movieType: movieType) { movie in
                completion(movie)
            }
        }
    }
    

   /* public func getUpcomingMovies(movieType: MovieType, completion: @escaping([Movie]?)->Void) {
        
    
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
    }*/
}
