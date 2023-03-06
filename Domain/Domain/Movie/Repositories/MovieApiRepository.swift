//
//  MovieApiRepository.swift
//  Domain
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 20/10/22.
//

import Foundation


public protocol MovieApiRepository {
    func getMovies(movieType: MovieType,completion: @escaping([Domain.Movie]?, _ error: RuntimeError?)->Void) throws
}
