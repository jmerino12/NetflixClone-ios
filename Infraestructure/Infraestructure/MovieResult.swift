//
//  MovieResult.swift
//  Infraestructure
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 21/10/22.
//

import Foundation


struct Dates: Codable {
    let maximum, minimum: String
}

struct MovieResult: Codable {
    let dates: Dates
    let page: Int
    let results: [Movie]
    let total_pages, total_results: Int
}

public struct Movie: Codable {
    let adult: Bool
    let backdrop_path: String
    let genre_ids: [Int]
    let id: Int
    let original_language: String
    let original_title: String
    let overview: String
    let popularity: Double
    let poster_path:String
    let release_date: String
    let title: String
    let video: Bool
    let vote_average: Float
    let vote_count: Int
}

