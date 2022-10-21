//
//  MovieTranslator.swift
//  Infraestructure
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 21/10/22.
//

import Foundation
import Domain

public class MovieTranslator {
    func fromDomainToDto(movie: Movie) -> Domain.Movie {
        return Domain.Movie(adult: movie.adult, backdrop_path: movie.backdrop_path, genre_ids: movie.genre_ids, id: movie.id, original_language: movie.original_language, original_title: movie.original_title, overview: movie.overview, popularity: movie.popularity, poster_path: movie.poster_path, release_date: movie.release_date, title: movie.title, video: movie.video, vote_average: movie.vote_average, vote_count: movie.vote_count)
    }
}
