//
//  MovieRepository.swift
//  Domain
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 29/11/22.
//

import Foundation

public protocol MovieRepository {
    func getAllMovies(movieType: MovieType, completion: @escaping ([Movie]?) -> Void)
}
