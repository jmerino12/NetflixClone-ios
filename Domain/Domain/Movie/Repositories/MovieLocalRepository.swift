//
//  MovieLocalRepository.swift
//  Domain
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 25/10/22.
//

import Foundation

public protocol MovieLocalRepository {
    func getUpcomingMovies(completion: @escaping ([Domain.Movie]?) -> Void)
    func getTopRateMovies(completion: @escaping ([Domain.Movie]?) -> Void)
    func getPopularMovies(completion: @escaping ([Domain.Movie]?) -> Void)
    func getLatestMovies(completion: @escaping ([Domain.Movie]?) -> Void)
    func isEmpty(type: String) -> Bool
    func saveMovies(movie: Movie, typeMovie: String)
}
