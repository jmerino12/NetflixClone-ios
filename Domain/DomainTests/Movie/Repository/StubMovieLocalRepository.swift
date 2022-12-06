//
//  StubMovieLocalRepository.swift
//  DomainTests
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 5/12/22.
//

import Foundation
@testable import Domain

public class StubMovieLocalRepository: MovieLocalRepository {
    
    var movies: [Movie] = []
    
    public func getMovieFor(movieType: MovieType, completion: @escaping ([Movie]?) -> Void) {
        completion(movies)
    }
    
    public func isEmpty(movieType: MovieType) -> Bool {
        return false
        
    }
    
    public func saveMovies(movie: Movie, typeMovie: MovieType) {
        movies.append(movie)
    }
    
    public func clearDB(movieType: MovieType) {
        movies.removeAll()
    }
    
    public func saveDate() {
        // Not Implemented
    }
    
    public func isMovieSavedMoreThan24Hours() -> Bool {
        return false
    }
}
