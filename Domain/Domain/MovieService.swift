//
//  MovieService.swift
//  Domain
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 20/10/22.
//

import Foundation

public struct MovieService {
    let repository: MovieRepository
    
    init(repository: MovieRepository) {
        self.repository = repository
    }
    
    func getMovie(movieType: MovieType , completion: @escaping ([Movie]?) -> Void) {
        repository.getAllMovies(movieType: movieType) { movie in
            completion(movie)
        }
    }
}
