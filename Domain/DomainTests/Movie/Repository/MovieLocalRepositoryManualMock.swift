//
//  MovieLocalRepositoryManualMock.swift
//  DomainTests
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 23/11/22.
//

import Domain

public class MovieLocalRepositoryManualMock: MovieLocalRepository {
    
    public func getMovieFor(movieType: Domain.MovieType, completion: @escaping ([Domain.Movie]?) -> Void) {
        completion(moviesInLocalStore)
    }
    
    public func clearDB(movieType: Domain.MovieType) {
        //Not implemented
    }
    
    public func saveDate() {
        //Not implemented
    }
    
    public func isMovieSavedMoreThan24Hours() -> Bool {
        return false
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
