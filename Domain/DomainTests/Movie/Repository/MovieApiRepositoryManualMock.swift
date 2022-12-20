//
//  MovieApiRepositoryManualMock.swift
//  DomainTests
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 23/11/22.
//

import Domain

public class MovieApiRepositoryManualMock: MovieApiRepository {
    public func getMovies(movieType: Domain.MovieType, completion: @escaping ([Domain.Movie]?) -> Void) throws {
        var movies =  [Movie]()
        for _ in 1...20 {
            movies.append(MovieTestDataBuilder().build())
        }
        completion(movies)
    }

}
