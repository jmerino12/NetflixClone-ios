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
    
    public func getMovieFor(movieType: Domain.MovieType, completion: @escaping ([Domain.Movie]?) -> Void) {
        let movieTranslator = MovieTranslator()
        do{
            guard let category = getCategory(categoryName: movieType.name) else { return }
            let request: NSFetchRequest<MovieDB> = MovieDB.fetchRequest()
            request.predicate = NSPredicate(format: "type == %@", category)
            let result = try coreData.managedContext.fetch(request)
            print(result.count)
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
    
    
    public func isEmpty(movieType: MovieType) -> Bool {
        do{
            guard let category = getCategory(categoryName: movieType.name) else { return true  }
            let request: NSFetchRequest<MovieDB> = MovieDB.fetchRequest()
            request.predicate = NSPredicate(format: "type == %@", category)
            let result =  try coreData.managedContext.fetch(request)
            if result.isEmpty{
                return true
            }
        }catch {
            print("Error recuperando la data")
        }
        return false
    }

    
    public func getCategory(categoryName: String) -> MovieTypeDB? {
        do{
            let request: NSFetchRequest<MovieTypeDB> = MovieTypeDB.fetchRequest()
            request.predicate = NSPredicate(format: "name == %@", categoryName)
            let result =  try coreData.managedContext.fetch(request)
            if !result.isEmpty{
                return result[0]
            }
            return nil
        }catch {
            print("Error recuperando la data")
        }
        return nil
    }
    
    
    
    public func saveMovies(movie: Domain.Movie, typeMovie: Domain.MovieType) {
        do {
            let movieTranslator = MovieTranslator()
            let movieTypeTranslator = MovieTypeTranslator()
            let movieResult = movieTranslator.fromDomainToDatabase(movie: movie, context: coreData.managedContext)
            let movieTypeResult = movieTypeTranslator.fromDomainToDatabase(movieType: typeMovie, context: coreData.managedContext)
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
            
            movieTypeResult.idMoveType = Int16(typeMovie.id)
            movieTypeResult.name = typeMovie.name
            
            movieResult.type = movieTypeResult
            
            try coreData.managedContext.save()
        } catch (let error) {
            print(error)
            return
        }
    }
    
    
    public func clearDB(movieType: MovieType) {
        do {
            guard let category = getCategory(categoryName: movieType.name) else { return }
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "MovieDB")
            request.predicate = NSPredicate(format: "type == %@", category)
            let result =  NSBatchDeleteRequest(fetchRequest: request)
            try coreData.managedContext.execute(result)
        } catch (let error) {
            print(error)
            return
        }

    }
    
    public func saveDate() {
        UserDefaults.standard.set(Date(), forKey: "dateToSaveMovie")
    }
    
    public func isMovieSavedMoreThan24Hours() -> Bool {
        let date = UserDefaults.standard.object(forKey: "dateToSaveMovie") as? Date
        if date != nil {
            let interval = Date() - date!
            if abs(interval.hour!) >= 24{
                return true
            }
        }
        return false
    }
}
