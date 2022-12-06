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
           /* myMovies?.append(Movie(adult: true, backdrop_path: "", genre_ids: [], id: 211, original_language: "en", original_title: "Petite HD Porn 19: Sex Play", overview: "Tiny tits, tight, little butts and the sweetest, wettest pussies promise to deliver the petite pleasure you crave!", popularity: 2121, poster_path: "/zCT4Tzq4RH1DFlL4jgqpGu2Zjdo.jpg", release_date: "", title: "Petite HD Porn 19: Sex Play", video: false, vote_average: 323, vote_count: 13))*/
            if (!user.isAdult()){
                myMovies?.removeAll(where: {$0.adult })
            }
            completion(myMovies)
        }
    }
}
