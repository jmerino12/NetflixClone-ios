//
//  MovieModel.swift
//  NetflixClone
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 10/10/22.
//

import Foundation

struct Movie: Codable, Identifiable {
    let adult: Bool
    let backdrop_path: String?
    let genre_ids: [Int]
    let id: Int
    let original_language, original_title, overview: String
    let popularity: Double
    let poster_path: String
    let title: String
    let video: Bool
    let vote_average: Double
    let vote_count: Int
    
}
