//
//  MovieLocalRepository.swift
//  Domain
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 25/10/22.
//

import Foundation

public protocol MovieLocalRepository {
    func getMovieFor(movieType: MovieType, completion: @escaping ([Movie]?) -> Void)
    func isEmpty(movieType: MovieType) -> Bool
    func saveMovies(movie: Movie, typeMovie: MovieType)
    func clearDB(movieType: MovieType)
    func saveDate()
    func isMovieSavedMoreThan24Hours() -> Bool
}
