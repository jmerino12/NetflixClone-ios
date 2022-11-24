//
//  MovieTypeDB+CoreDataProperties.swift
//  Infraestructure
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 24/11/22.
//
//

import Foundation
import CoreData


extension MovieTypeDB {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MovieTypeDB> {
        return NSFetchRequest<MovieTypeDB>(entityName: "MovieTypeDB")
    }

    @NSManaged public var name: String?
    @NSManaged public var idMoveType: Int16
    @NSManaged public var movies: NSSet?
    
    public override func awakeFromInsert() {
        super.awakeFromInsert()
        setPrimitiveValue(Int16(), forKey: #keyPath(MovieTypeDB.idMoveType))
    }

}

// MARK: Generated accessors for movies
extension MovieTypeDB {

    @objc(addMoviesObject:)
    @NSManaged public func addToMovies(_ value: MovieDB)

    @objc(removeMoviesObject:)
    @NSManaged public func removeFromMovies(_ value: MovieDB)

    @objc(addMovies:)
    @NSManaged public func addToMovies(_ values: NSSet)

    @objc(removeMovies:)
    @NSManaged public func removeFromMovies(_ values: NSSet)

}

extension MovieTypeDB : Identifiable {

}
