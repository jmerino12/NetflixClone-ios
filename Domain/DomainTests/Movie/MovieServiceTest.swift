//
//  MovieApiRepositoryTest.swift
//  DomainTests
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 21/11/22.
//

import XCTest
@testable import Domain

final class MovieServiceTest: XCTestCase {

    func test_getPopularMoviesFromApi_successful() {
        //Arange
        let movieLocalRepository: MovieLocalRepositoryManualMock = MovieLocalRepositoryManualMock()
        let movieApiRepository: MovieApiRepositoryManualMock = MovieApiRepositoryManualMock()
        
        let movieService: MovieService = MovieService(movieApiRepository: movieApiRepository, movieLocalRepository: movieLocalRepository)
        
        
        //Act
        //Assert
        movieService.getPopularMovies(movieType: MovieType(name: "", id: 1)) { movies in
            let value = (movies != nil && !movies!.isEmpty) ? true : false

            XCTAssertTrue(value)
        }
        
    }
    
    func test_getPopularMoviesFromCoreData_successful() {
        //Arange
        let movieLocalRepository: MovieLocalRepositoryManualMock = MovieLocalRepositoryManualMock()
        let movieApiRepository: MovieApiRepositoryManualMock = MovieApiRepositoryManualMock()
        
        let movieService: MovieService = MovieService(movieApiRepository: movieApiRepository, movieLocalRepository: movieLocalRepository)
    
        
        //Act
        //Assert
        if !movieLocalRepository.isEmpty(movieType:MovieType(name: "", id: 0) ) {
            movieService.getPopularMovies(movieType: MovieType(name: "", id: 0)) { movie in
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
