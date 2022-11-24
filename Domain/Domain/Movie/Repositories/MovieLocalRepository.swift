//
//  MovieLocalRepository.swift
//  Domain
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 25/10/22.
//

import Foundation

public protocol MovieLocalRepository {
    func getUpcomingMovies(movieType: MovieType, completion: @escaping ([Domain.Movie]?) -> Void)
    func getTopRateMovies(movieType: MovieType, completion: @escaping ([Domain.Movie]?) -> Void)
    func getPopularMovies(movieType: MovieType, completion: @escaping ([Domain.Movie]?) -> Void)
    func getLatestMovies(movieType: MovieType, completion: @escaping ([Domain.Movie]?) -> Void)
    func isEmpty(movieType: MovieType) -> Bool
    func saveMovies(movie: Movie, typeMovie: MovieType)
}
