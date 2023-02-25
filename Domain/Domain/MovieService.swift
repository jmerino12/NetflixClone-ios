//
//  MovieService.swift
//  Domain
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 20/10/22.
//

import Foundation

public struct MovieService {
    private let repository: MovieRepository
    private let user: User
    
    public init(repository: MovieRepository, user: User) {
        self.repository = repository
        self.user = user
    }
    
    public func getMovie(movieType: MovieType , completion: @escaping ([Movie]?) -> Void) {
        repository.getAllMovies(movieType: movieType) { movies in
            var myMovies = movies
            if (!user.isAdult()){
                myMovies?.removeAll(where: {$0.adult })
            }
            completion(myMovies)
        }
    }
}
