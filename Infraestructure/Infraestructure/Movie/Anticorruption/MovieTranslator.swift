//
//  MovieTranslator.swift
//  Infraestructure
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 21/10/22.
//

import Foundation
import Domain
import CoreData

public class MovieTranslator {
    func fromApiToDomain(movie: Movie) -> Domain.Movie {
        return Domain.Movie(adult: movie.adult, backdrop_path: movie.backdrop_path, genre_ids: movie.genre_ids, id: movie.id, original_language: movie.original_language, original_title: movie.original_title, overview: movie.overview, popularity: movie.popularity, poster_path: movie.poster_path, release_date: movie.release_date, title: movie.title, video: movie.video, vote_average: movie.vote_average, vote_count: movie.vote_count)
    }
    
    func fromDatabaseToDomain(moviedb: MovieDB) -> Domain.Movie {
        return Domain.Movie(adult: moviedb.adult, backdrop_path: moviedb.backdrop_path, genre_ids: [], id: Int(moviedb.id), original_language: moviedb.original_language ?? "", original_title: moviedb.original_title ?? "", overview: moviedb.overview ?? "", popularity: moviedb.popularity, poster_path: moviedb.poster_path ?? "", release_date: moviedb.release_date ?? "", title: moviedb.title ?? "", video: moviedb.video, vote_average: moviedb.vote_average, vote_count: Int(moviedb.vote_count))
    }
    
    func fromDomainToDatabase(movie: Domain.Movie, context: NSManagedObjectContext) -> MovieDB {
        return MovieDB(context: context)
    }
    
}
