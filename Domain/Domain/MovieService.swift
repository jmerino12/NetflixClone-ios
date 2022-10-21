//
//  MovieService.swift
//  Domain
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 20/10/22.
//

import Foundation

public struct MovieService {
    let movieRepository: MovieApiRepository
    
    func getUpcomingMovies(){
        return movieRepository.getUpcomingMovies { _ in
            
        }
    }
}
