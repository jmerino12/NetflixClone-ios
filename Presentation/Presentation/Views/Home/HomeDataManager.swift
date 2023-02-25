//
//  HomeDataManager.swift
//  Presentation
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 17/01/23.
//

import Foundation
import Domain
import Infraestructure


class HomeDataManager: HomeViewDataManagerInputProtocol {
        
    private let movieService: MovieService?
    private let movieTypeUpcoming = MovieType(name: "Upcoming", id: 1)
    private let movieTypeTopRateMovie = MovieType(name: "Top Rate Movies", id: 2)
    private let movieTypePopularMovie = MovieType(name: "Popular Movies", id: 3)
    private let movieTypeLastestMovie = MovieType(name: "Lastest", id: 4)
    
    var dataManager: HomeViewDataManagerOutputProtocol?
    
    init(movieService: MovieService) {
        self.movieService = movieService
        
    }
    
    
    func getUpcomingMovies() {
        movieService?.getMovie(movieType: movieTypeUpcoming) { movie in
            self.dataManager?.getUpcomingMoviesFromDataManager(with: movie ?? [])
        }
    }
    func getTopRateMovies() {
        movieService?.getMovie(movieType: movieTypeTopRateMovie, completion: { movie in
            self.dataManager?.getTopRateMoviesManager(with: movie ?? [])
        })
    }
    
    func getPopularMovies() {
        movieService?.getMovie(movieType: movieTypePopularMovie, completion: { movie in
            self.dataManager?.getPopularMoviesFromDataManager(with: movie ?? [])
        })
    }
    
    func getLastestMovies() {
        movieService?.getMovie(movieType: movieTypeLastestMovie, completion: { movie in
            self.dataManager?.getLastestMoviesManager(with: movie ?? [])
        })
    }
    
    
}
