//
//  MovieLocalRepositoryManualMock.swift
//  DomainTests
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 23/11/22.
//

import Domain

public class MovieLocalRepositoryManualMock: MovieLocalRepository {
    public func getUpcomingMovies(completion: @escaping ([Domain.Movie]?) -> Void) {
        <#code#>
    }
    
    public func getTopRateMovies(completion: @escaping ([Domain.Movie]?) -> Void) {
        <#code#>
    }
    
    public func getPopularMovies(completion: @escaping ([Domain.Movie]?) -> Void) {
        <#code#>
    }
    
    public func getLatestMovies(completion: @escaping ([Domain.Movie]?) -> Void) {
        <#code#>
    }
    
    public func isEmpty(type: String) -> Bool {
        <#code#>
    }
    
    public func saveMovies(movie: Domain.Movie, typeMovie: String) {
        <#code#>
    }
    



}
