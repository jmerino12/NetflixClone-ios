//
//  MovieLocalRepositoyImpl.swift
//  Infraestructure
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 25/10/22.
//

import UIKit
import CoreData
import Domain

public class MovieLocalRepositoryImpl: MovieLocalRepository {

    var coreData: CoreDataStack
    
    public init(coreData: CoreDataStack){
        self.coreData = coreData
    }
    
    public func getUpcomingMovies(completion: @escaping ([Domain.Movie]?) -> Void) {
        let movieTranslator = MovieTranslator()

        do{
            let request: NSFetchRequest<MovieDB> = MovieDB.fetchRequest()
            let pred = NSPredicate(format: "type == 1")
            request.predicate = pred
            let result = try coreData.managedContext.fetch(request)
            let myDomainMovies = result.enumerated().map { (index, element) in
                return movieTranslator.fromDatabaseToDomain(moviedb: element)
            }
            DispatchQueue.main.async {
                completion(myDomainMovies)
            }
            
        }catch {
           print("Error recuperando la data")
        }
    }
    
    public func getTopRateMovies(completion: @escaping ([Domain.Movie]?) -> Void) {
        let movieTranslator = MovieTranslator()
        do{
            let request: NSFetchRequest<MovieDB> = MovieDB.fetchRequest()
            let pred = NSPredicate(format: "type == 2")
            request.predicate = pred
            let result = try coreData.managedContext.fetch(request)
            let myDomainMovies = result.enumerated().map { (index, element) in
                return movieTranslator.fromDatabaseToDomain(moviedb: element)
            }
            DispatchQueue.main.async {
                completion(myDomainMovies)
            }
        }catch {
           print("Error recuperando la data")
        }

    }
    
    public func getPopularMovies(completion: @escaping ([Domain.Movie]?) -> Void) {
        let movieTranslator = MovieTranslator()
        do{
            let request: NSFetchRequest<MovieDB> = MovieDB.fetchRequest()
            let pred = NSPredicate(format: "type == 3")
            request.predicate = pred
            let result = try coreData.managedContext.fetch(request)
            let myDomainMovies = result.enumerated().map { (index, element) in
                return movieTranslator.fromDatabaseToDomain(moviedb: element)
            }
            DispatchQueue.main.async {
                completion(myDomainMovies)
            }
        }catch {
           print("Error recuperando la data")
        }

    }
    
    public func getLatestMovies(completion: @escaping ([Domain.Movie]?) -> Void) {
        let movieTranslator = MovieTranslator()
        do{
            let request: NSFetchRequest<MovieDB> = MovieDB.fetchRequest()
            let pred = NSPredicate(format: "type == 4")
            request.predicate = pred
            let result = try coreData.managedContext.fetch(request)
            let myDomainMovies = result.enumerated().map { (index, element) in
                return movieTranslator.fromDatabaseToDomain(moviedb: element)
            }
            DispatchQueue.main.async {
                completion(myDomainMovies)
            }
        }catch {
           print("Error recuperando la data")
        }
    }
    
    public func isEmpty(type: String) -> Bool {
        do{
            let request: NSFetchRequest<MovieDB> = MovieDB.fetchRequest()
            let pred = NSPredicate(format: "type == \(type)")
            request.predicate = pred
            let result =  try coreData.managedContext.fetch(request)
            if result.isEmpty{
                return true
            }

        }catch {
           print("Error recuperando la data")
        }
        return false
    }
    
    public func saveMovies(movie: Domain.Movie, typeMovie: String) {
        let movieTranslator = MovieTranslator()
        let movieResult = movieTranslator.fromDomainToDatabase(movie: movie, context: coreData.managedContext)
        movieResult.title = movie.title
        movieResult.overview = movie.overview
        movieResult.vote_count = Int64(movie.vote_count)
        movieResult.vote_average = movie.vote_average
        movieResult.video = movie.video
        movieResult.adult = movie.adult
        movieResult.poster_path = movie.poster_path
        movieResult.backdrop_path = movie.backdrop_path
        movieResult.id = Int64(movie.id)
        movieResult.original_language = movie.original_language
        movieResult.original_title = movie.original_language
        movieResult.popularity = movie.popularity
        movieResult.release_date = movie.release_date
        movieResult.type = typeMovie
        try! coreData.managedContext.save()
    }
    
    
}
