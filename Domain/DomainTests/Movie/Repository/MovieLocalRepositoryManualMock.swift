//
//  MovieLocalRepositoryManualMock.swift
//  DomainTests
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 23/11/22.
//

import Domain

public class MovieLocalRepositoryManualMock: MovieLocalRepository {
    public func getUpcomingMovies(movieType: Domain.MovieType, completion: @escaping ([Domain.Movie]?) -> Void) {
        completion(moviesInLocalStore)
    }
    
    public func getTopRateMovies(movieType: Domain.MovieType, completion: @escaping ([Domain.Movie]?) -> Void) {
        completion(moviesInLocalStore)
    }
    
    public func getPopularMovies(movieType: Domain.MovieType, completion: @escaping ([Domain.Movie]?) -> Void) {
        completion(moviesInLocalStore)
    }
    
    public func getLatestMovies(movieType: Domain.MovieType, completion: @escaping ([Domain.Movie]?) -> Void) {
        completion(moviesInLocalStore)
    }
    
    public func isEmpty(movieType: Domain.MovieType) -> Bool {
        switch movieType.id {
        case 0:
            return false
        default: return true
        }
    }
    
    public func saveMovies(movie: Domain.Movie, typeMovie: Domain.MovieType) {
        //Not implemented
    }
    
    
    
    
    
    
}
