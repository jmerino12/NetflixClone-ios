//
//  FakeMovieApiRepository.swift
//  DomainTests
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 5/12/22.
//

import Foundation
@testable import Domain


public class FakeMovieRepository: MovieRepository {
    
    private var movies: [Movie] = []
    
    public func getAllMovies(movieType: Domain.MovieType, completion: @escaping ([Domain.Movie]?) -> Void) {
        completion(movies)
    }
    
    
}
