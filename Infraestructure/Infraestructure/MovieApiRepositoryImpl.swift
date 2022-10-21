//
//  MovieApiRepositoryImpl.swift
//  Infraestructure
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 20/10/22.
//

import Domain
import Foundation


public class MovieApiRepositoryImpl: MovieApiRepository {
    
    
    let apiCaller: APICaller
    
    public init() {
        apiCaller = APICaller()
    }
    
    public func getUpcomingMovies(completion: @escaping ([Domain.Movie]?) -> Void) {
        let movieTranslator = MovieTranslator()
        apiCaller.getUpcommingMovies(with: "\(Constanst.baseURL)/movie/upcoming?api_key=\(Constanst.api_key)") { result in
            switch result{
            case .success(let movies):
                let myDtoMovies = movies.enumerated().map { (index, element) in
                    return movieTranslator.fromDomainToDto(movie: element)
                }
                completion(myDtoMovies)
            case .failure(let myError):
                print(myError)
            }
        }
        
    }
    
}







