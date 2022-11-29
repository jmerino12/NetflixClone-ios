//
//  MovieApiRepositoryImpl.swift
//  Infraestructure
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 20/10/22.
//

import Foundation
import CoreLocation
import Domain


public class MovieApiRepositoryImpl: MovieApiRepository {
 
    private let apiCaller: APICaller
    private let locationRepository: LocationRepository
    
    public init() {
        apiCaller = APICaller()
        let locationManager : CLLocationManager = CLLocationManager()
        locationRepository = LocationRepositoryImpl(permissionChecker: LocationPermissionCheckerImpl(locationManager: locationManager), locationManager: locationManager)
    }
    
    public func getUpcomingMovies(completion: @escaping ([Domain.Movie]?) -> Void) {
        locationRepository.findLastRegion{ region in
                let movieTranslator = MovieTranslator()
                self.apiCaller.fetchMovies(with: "\(Constanst.baseURL)/movie/upcoming?api_key=\(Constanst.api_key)&region=US") { result in
                    switch result {
                    case .none:
                        debugPrint("Error")
                    case .some(let data):
                        let myDtoMovies = data.enumerated().map { (index, element) in
                            return movieTranslator.fromApiToDomain(movie: element)
                        }
                        DispatchQueue.main.async {
                            completion(myDtoMovies)
                        }
                    }
                    
                
            }

            
        }
        
        
    }
    
    public func getTopRateMovies(completion: @escaping ([Domain.Movie]?) -> Void) {
        locationRepository.findLastRegion { region in
            let movieTranslator = MovieTranslator()
            print("\(Constanst.baseURL)/movie/top_rated?api_key=\(Constanst.api_key)&region=\(region)")
            self.apiCaller.fetchData(with: "\(Constanst.baseURL)/movie/top_rated?api_key=\(Constanst.api_key)&region=\(region)") { result in
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
    
    public func getPopularMovies(completion: @escaping ([Domain.Movie]?) -> Void) {
        locationRepository.findLastRegion { region in
            let movieTranslator = MovieTranslator()
            print("\(Constanst.baseURL)/movie/popular?api_key=\(Constanst.api_key)&region=\(region)")
            self.apiCaller.fetchData(with: "\(Constanst.baseURL)/movie/popular?api_key=\(Constanst.api_key)&region=\(region)&page=2") { result in
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
    
    public func getLatestMovies(completion: @escaping ([Domain.Movie]?) -> Void) {
        locationRepository.findLastRegion { region in
            let movieTranslator = MovieTranslator()
            print("\(Constanst.baseURL)/discover/movie?sort_by=popularity.desc&api_key=\(Constanst.api_key)&region=\(region)")
            self.apiCaller.fetchData(with: "\(Constanst.baseURL)/discover/movie?sort_by=popularity.desc&api_key=\(Constanst.api_key)&region=\(region)") { result in
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
    
    
}







