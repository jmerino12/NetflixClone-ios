//
//  MovieBuilder.swift
//  DomainTests
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 16/12/22.
//

import Foundation
@testable import Domain


class MovieTestDataBuilder {
    
    let overview = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
    let movieTitle = "Movie \(String.random(length: 20))"
    let gnres_ids = (1...5).map( {_ in Int.random(in: 1...100)} )
    let language = ["ES", "EN", "JAP"].randomElement()
    
    
    func build() -> Movie {
        return Movie(adult: Bool.random(), backdrop_path: "/\(String.random(length: 20))", genre_ids: gnres_ids, id: UUID().uuidString.hash, original_language: language!, original_title: movieTitle, overview: overview, popularity: Double.random(in: 100...200), poster_path: "/\(String.random(length: 20))", release_date: "2020/01/10", title: movieTitle, video: Bool.random(), vote_average: Float.random(in: 0..<200), vote_count: Int.random(in: 0..<200))
    }
}


extension String{
   static func random(length:Int)->String{
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        var randomString = ""

        while randomString.utf8.count < length{
            let randomLetter = letters.randomElement()
            randomString += randomLetter?.description ?? ""
        }
        return randomString
    }
    
}

extension Int {
    func makeList(_ n: Int) -> [Int] {
        return (0..<n).map { _ in .random(in: 1...20) }
    }
}
