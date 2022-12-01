//
//  MovieApiRepositoryTest.swift
//  DomainTests
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 21/11/22.
//

import XCTest
@testable import Domain
@testable import Infraestructure

final class MovieServiceTest: XCTestCase {

    func test_getPopularMovies_successful() {
        //Arange
        let movieLocalRepository: MovieLocalRepositoryManualMock = MovieLocalRepositoryManualMock()
        let movieApiRepository: MovieApiRepositoryManualMock = MovieApiRepositoryManualMock()
        let movieProxy: MovieProxy = MovieProxy(movieApiRepository: movieApiRepository, movieLocalRepository: movieLocalRepository)
        let user : User = User(age: 18)
        let movieService: MovieService = MovieService(repository: movieProxy, user: user)
        let movieType = MovieType(name: "", id: 1)
        
        
        //Act
        //Assert
        movieService.getMovie(movieType: movieType) { movies in
            let value = (movies != nil && !movies!.isEmpty) ? true : false
            XCTAssertTrue(value)
        }
        
        
    }
    
    func test_getPopularMoviesFromCoreData_successful() {
        //Arange
        let movieLocalRepository: MovieLocalRepositoryManualMock = MovieLocalRepositoryManualMock()
        let movieApiRepository: MovieApiRepositoryManualMock = MovieApiRepositoryManualMock()
        let movieProxy: MovieProxy = MovieProxy(movieApiRepository: movieApiRepository, movieLocalRepository: movieLocalRepository)
        let user : User = User(age: 18)
        let movieService: MovieService = MovieService(repository: movieProxy, user: user)
        let movieType = MovieType(name: "", id: 0)
    
        
        //Act
        //Assert
        if !movieLocalRepository.isEmpty(movieType: movieType) {
            movieService.getMovie(movieType: movieType) { movie in
                let value = (movie != nil && !movie!.isEmpty) ? true : false
                XCTAssertTrue(value)
            }
        }
    }
    
    func test_savePopularMoviesToCoreData_successful() {
        //Arange
        let movieLocalRepository: MovieLocalRepositoryManualMock = MovieLocalRepositoryManualMock()
        
        //Act
        //Assert
        movieLocalRepository.saveMovies(movie: moviesInApi[0], typeMovie: MovieType(name: "Lastet", id: 1))
    }
    
    
    
}
