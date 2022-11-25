//
//  MovieApiRepositoryManualMock.swift
//  DomainTests
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 23/11/22.
//

import Domain

public class MovieApiRepositoryManualMock: MovieApiRepository {
    
    public func getUpcomingMovies(completion: @escaping ([Domain.Movie]?) -> Void) {
        completion(moviesInApi)
    }
    
    public func getTopRateMovies(completion: @escaping ([Domain.Movie]?) -> Void) {
        completion(moviesInApi)
    }
    
    public func getPopularMovies(completion: @escaping ([Domain.Movie]?) -> Void) {
        completion(moviesInApi)
    }
    
    public func getLatestMovies(completion: @escaping ([Domain.Movie]?) -> Void) {
        completion(moviesInApi)
    }
    

}
