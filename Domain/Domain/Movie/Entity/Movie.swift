//
//  Movie.swift
//  Domain
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 20/10/22.
//

import Foundation

public struct Movie {
    public let adult: Bool
    public let backdrop_path: String?
    public let genre_ids: [Int]
    public let id: Int
    public let original_language: String
    public let original_title: String
    public let overview: String
    public let popularity: Double
    public let poster_path:String?
    public let release_date: String
    public let title: String
    public let video: Bool
    public let vote_average: Float
    public let vote_count: Int
    
    public init(adult: Bool, backdrop_path: String?, genre_ids: [Int], id: Int, original_language: String, original_title: String, overview: String, popularity: Double, poster_path: String?, release_date: String, title: String, video: Bool, vote_average: Float, vote_count: Int) {
        self.adult = adult
        self.backdrop_path = backdrop_path
        self.genre_ids = genre_ids
        self.id = id
        self.original_language = original_language
        self.original_title = original_title
        self.overview = overview
        self.popularity = popularity
        self.poster_path = poster_path
        self.release_date = release_date
        self.title = title
        self.video = video
        self.vote_average = vote_average
        self.vote_count = vote_count
    }
}
