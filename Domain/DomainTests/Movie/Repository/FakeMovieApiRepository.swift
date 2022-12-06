//
//  FakeMovieApiRepository.swift
//  DomainTests
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 5/12/22.
//

import Foundation
@testable import Domain

public class FakeMovieApiRepository: MovieApiRepository {

    var movies: [Movie] = []
    
    public func getMovies(movieType: Domain.MovieType, completion: @escaping ([Domain.Movie]?) -> Void) throws {
        completion(movies)
    }
    
}
