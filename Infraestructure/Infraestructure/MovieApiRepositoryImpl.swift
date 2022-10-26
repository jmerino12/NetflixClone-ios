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
        apiCaller.fetchData(with: "\(Constanst.baseURL)/movie/upcoming?api_key=\(Constanst.api_key)") { result in
            switch result{
            case .success(let movies):
                let myDtoMovies = movies.enumerated().map { (index, element) in
                    return movieTranslator.fromApiToDomain(movie: element)
                }
                DispatchQueue.main.async {
                    completion(myDtoMovies)
                }
                
            case .failure(let myError):
                print(myError)
            }
        }
        
    }
    
    public func getTopRateMovies(completion: @escaping ([Domain.Movie]?) -> Void) {
        let movieTranslator = MovieTranslator()
        apiCaller.fetchData(with: "\(Constanst.baseURL)/movie/top_rated?api_key=\(Constanst.api_key)") { result in
            switch result{
            case .success(let movies):
                let myDtoMovies = movies.enumerated().map { (index, element) in
                    return movieTranslator.fromApiToDomain(movie: element)
                }
                DispatchQueue.main.async {
                    completion(myDtoMovies)
                }
            case .failure(let myError):
                print(myError)
            }
        }
    }
    
    public func getPopularMovies(completion: @escaping ([Domain.Movie]?) -> Void) {
        let movieTranslator = MovieTranslator()
        apiCaller.fetchData(with: "\(Constanst.baseURL)/movie/popular?api_key=\(Constanst.api_key)") { result in
            switch result{
            case .success(let movies):
                let myDtoMovies = movies.enumerated().map { (index, element) in
                    return movieTranslator.fromApiToDomain(movie: element)
                }
                DispatchQueue.main.async {
                    completion(myDtoMovies)
                }
            case .failure(let myError):
                print(myError)
            }
        }
    }
    
    public func getLatestMovies(completion: @escaping ([Domain.Movie]?) -> Void) {
        let movieTranslator = MovieTranslator()
        apiCaller.fetchData(with: "\(Constanst.baseURL)/movie/upcoming?api_key=\(Constanst.api_key)&page=2") { result in
            switch result{
            case .success(let movies):
                let myDtoMovies = movies.enumerated().map { (index, element) in
                    return movieTranslator.fromApiToDomain(movie: element)
                }
                DispatchQueue.main.async {
                    completion(myDtoMovies)
                }
            case .failure(let myError):
                print(myError)
            }
        }
    }
    
    
}







