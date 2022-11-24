//
//  MovieTypeTranslator.swift
//  Infraestructure
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 23/11/22.
//

import Foundation
import CoreData
import Domain

public class MovieTypeTranslator {

    func fromDatabaseToDomain(movieType: MovieTypeDB) ->  Domain.MovieType {
        return Domain.MovieType(name: movieType.name!, id: Int(movieType.idMoveType))
    }
    
    func fromDomainToDatabase(movieType: Domain.MovieType, context: NSManagedObjectContext) ->  MovieTypeDB {
        let movieTypeResult = MovieTypeDB(context: context)
        movieTypeResult.name = movieType.name
        return movieTypeResult
    }
    
}


