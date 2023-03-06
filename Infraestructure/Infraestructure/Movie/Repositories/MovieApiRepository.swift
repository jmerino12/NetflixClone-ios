//
//  MovieApiRepositoryImpl.swift
//  Infraestructure
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 20/10/22.
//

import Foundation
import CoreLocation
import Domain


public class MovieAlamofireRepository: MovieApiRepository {
    
    private let apiCaller: APICaller
    private let locationRepository: LocationRepository
    
    public init() {
        apiCaller = APICaller()
        let locationManager : CLLocationManager = CLLocationManager()
        locationRepository = LocationRepositoryImpl(permissionChecker: LocationPermissionCheckerImpl(locationManager: locationManager), locationManager: locationManager)
    }
    
    public func getMovies(movieType: MovieType, completion: @escaping (_ movies: [Domain.Movie]?,  _ error: RuntimeError?) -> Void)throws -> Void
    {
        switch movieType.name {
        case "Upcoming":
            getUpcomingMovies { movie, error in
                completion(movie, error)
            }
            break
            
        case "Top Rate Movies":
            getTopRateMovies { movie, error in
                completion(movie, error)
            }
            break
            
        case "Popular Movies":
            getPopularMovies { movie, error in
                completion(movie, error)
            }
            break
            
        case "Lastest":
            getLatestMovies { movie, error in
                completion(movie, error)
            }
            break
        default:
            fatalError("No se encuentra implementado esta categoria")
        }
    }
    
    
    
    public func getUpcomingMovies(completion: @escaping (_ movies: [Domain.Movie]?,  _ error: RuntimeError?) -> Void) {
        locationRepository.findLastRegion{ region in
            let movieTranslator = MovieTranslator()
            self.apiCaller.fetchMovies(with: "\(Constanst.baseURL)/movie/upcoming?api_key=\(Constanst.api_key)&region=US") { success, result, error in
                if result != nil {
                    let myDtoMovies = result?.enumerated().map { (index, element) in
                        return movieTranslator.fromApiToDomain(movie: element)
                    }
                    DispatchQueue.main.async {
                        completion(myDtoMovies, nil)
                    }
                }else{
                    completion(nil, error)
                }
            }
        }
    
    }
    
    public func getTopRateMovies(completion: @escaping (_ movies: [Domain.Movie]?,  _ error: RuntimeError?) -> Void) {
        locationRepository.findLastRegion { region in
            let movieTranslator = MovieTranslator()
            self.apiCaller.fetchMovies(with: "\(Constanst.baseURL)/movie/top_rated?api_key=\(Constanst.api_key)&region=\(region)") { success, result, error in
                if result != nil {
                    let myDtoMovies = result?.enumerated().map { (index, element) in
                        return movieTranslator.fromApiToDomain(movie: element)
                    }
                    DispatchQueue.main.async {
                        completion(myDtoMovies, nil)
                    }
                }else{
                    completion(nil, error)
                }
                
            }
        }
        
    }
    
    public func getPopularMovies(completion: @escaping (_ movies: [Domain.Movie]?,  _ error: RuntimeError?) -> Void) {
        locationRepository.findLastRegion { region in
            let movieTranslator = MovieTranslator()
            self.apiCaller.fetchMovies(with: "\(Constanst.baseURL)/movie/popular?api_key=\(Constanst.api_key)&region=\(region)&page=2") { success, result, error in
                if result != nil {
                    let myDtoMovies = result?.enumerated().map { (index, element) in
                        return movieTranslator.fromApiToDomain(movie: element)
                    }
                    DispatchQueue.main.async {
                        completion(myDtoMovies, nil)
                    }
                }else{
                    completion(nil, error)
                }
                
            }
        }
        
    }
    
    public func getLatestMovies(completion: @escaping (_ movies: [Domain.Movie]?,  _ error: RuntimeError?) -> Void) {
        locationRepository.findLastRegion { region in
            let movieTranslator = MovieTranslator()
            self.apiCaller.fetchMovies(with: "\(Constanst.baseURL)/discover/movie?sort_by=popularity.desc&api_key=\(Constanst.api_key)&region=\(region)") { success, result, error in
                if result != nil {
                    let myDtoMovies = result?.enumerated().map { (index, element) in
                        return movieTranslator.fromApiToDomain(movie: element)
                    }
                    DispatchQueue.main.async {
                        completion(myDtoMovies, nil)
                    }
                }else{
                    completion(nil, error)
                }
            
            }
        }
        
    }
}
