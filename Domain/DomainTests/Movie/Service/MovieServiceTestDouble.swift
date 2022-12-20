//
//  MovieServiceTestDouble.swift
//  DomainTests
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 5/12/22.
//

import Foundation

import XCTest
@testable import Domain
@testable import Infraestructure

final class MovieServiceTestDouble: XCTestCase {
    
    func test_getAll_getEmpty_success() {
        //Arrange
        let movieApiRepository = FakeMovieApiRepository()
        let movieLocalRepository = FakeMovieLocalRepository()
        let movieProxy = MovieProxy(movieApiRepository: movieApiRepository, movieLocalRepository: movieLocalRepository)
        let movieService = MovieService(repository: movieProxy, user: User(age: 18))
        let movieType = MovieType(name: "", id: 1)
        //Act
        //Assert
         movieService.getMovie(movieType: movieType) { movie in
             XCTAssertEqual(0, movie?.count)
        }
    }
    
    func test_getMovies_fromApi_success() {
        //Arrange
        var movies = [Domain.Movie]()
        let movieApiRepository = FakeMovieApiRepository()
        for _ in 1...20 { movies.append(MovieTestDataBuilder().build()) }
        movieApiRepository.movies = movies
        let movieLocalRepository = FakeMovieLocalRepository()
        let movieProxy = MovieProxy(movieApiRepository: movieApiRepository, movieLocalRepository: movieLocalRepository)
        let movieService = MovieService(repository: movieProxy, user: User(age: 18))
        let movieType = MovieType(name: "", id: 1)
        //Act
        //Assert
         movieService.getMovie(movieType: movieType) { movie in
             XCTAssertEqual(movies.count, movie?.count)
        }
    }
    
    func test_getMovies_fromALocalStorage_success() {
        //Arrange
        var movies = [Domain.Movie]()
        let movieApiRepository = FakeMovieApiRepository()
        let movieLocalRepository = StubMovieLocalRepository()
        for _ in 1...20 { movies.append(MovieTestDataBuilder().build()) }
        movieLocalRepository.movies = movies
        let movieProxy = MovieProxy(movieApiRepository: movieApiRepository, movieLocalRepository: movieLocalRepository)
        let movieService = MovieService(repository: movieProxy, user: User(age: 18))
        let movieType = MovieType(name: "", id: 1)
        //Act
        //Assert
         movieService.getMovie(movieType: movieType) { movie in
             XCTAssertEqual(moviesInLocalStore.count, movie?.count)
        }
    }
    
    func test_getMovies_fromAdult_success() {
        //Arrange
        let movieApiRepository = FakeMovieApiRepository()
        movieApiRepository.movies = moviesInApi
        let movieLocalRepository = FakeMovieLocalRepository()
        let movieProxy = MovieProxy(movieApiRepository: movieApiRepository, movieLocalRepository: movieLocalRepository)
        let movieService = MovieService(repository: movieProxy, user: User(age: 18))
        let movieType = MovieType(name: "", id: 1)
        //Act
        //Assert
         movieService.getMovie(movieType: movieType) { movie in
             let movieFromAdult = movie?.first { $0.adult == true}
             XCTAssertTrue(movieFromAdult != nil)
        }
    }
    
    func test_getMovies_fromNotAdult_success() {
        //Arrange
        let movieApiRepository = FakeMovieApiRepository()
        movieApiRepository.movies = moviesInApi
        let movieLocalRepository = FakeMovieLocalRepository()
        let movieProxy = MovieProxy(movieApiRepository: movieApiRepository, movieLocalRepository: movieLocalRepository)
        let movieService = MovieService(repository: movieProxy, user: User(age: 17))
        let movieType = MovieType(name: "", id: 1)
        //Act
        //Assert
         movieService.getMovie(movieType: movieType) { movie in
             let movieFromAdult = movie?.first { $0.adult == true}
             XCTAssertTrue(movieFromAdult == nil)
        }
    }
    
        
}
