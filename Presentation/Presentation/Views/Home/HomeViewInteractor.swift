//
//  HomeViewInteractor.swift
//  Presentation
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 16/01/23.
//

import Foundation
import Domain

class HomeViewInteractor: HomeViewInteractorInputProtocol {
    
    private let movieService: MovieService?
    private let movieTypeUpcoming = MovieType(name: "Upcoming", id: 1)
    private let movieTypeTopRateMovie = MovieType(name: "Top Rate Movies", id: 2)
    private let movieTypePopularMovie = MovieType(name: "Popular Movies", id: 3)
    private let movieTypeLastestMovie = MovieType(name: "Lastest", id: 4)
    
    weak var presenter: HomeViewInteractorOutputProtocol?
    
    init(movieService: MovieService) {
        self.movieService = movieService
        
    }
    
    func getUpcomingMovies() {
        movieService?.getMovie(movieType: movieTypeUpcoming) { movie, error in
            guard error == nil else {
                self.presenter?.moviesFetchFailed()
                return
            }
            self.presenter?.interactorPushDataPresenter(recevideData: movie ?? [])
        }
    }
    
    func getTopRateMovies() {
        movieService?.getMovie(movieType: movieTypeTopRateMovie, completion: { movie, error in
            guard error == nil else {
                self.presenter?.moviesFetchFailed()
                return
            }
            self.presenter?.interactorPushTopRateMovie(recevideData: movie ?? [])
        })
    }
    
    func getPopularMovies() {
        movieService?.getMovie(movieType: movieTypePopularMovie, completion: { movie, error in
            guard error == nil else {
                self.presenter?.moviesFetchFailed()
                return
            }
            self.presenter?.interactorPushPopularMovie(recevideData: movie ?? [])
        })
    }
    
    func getLastestMovies() {
        movieService?.getMovie(movieType: movieTypeLastestMovie, completion: { movie, error in
            guard error == nil else {
                self.presenter?.moviesFetchFailed()
                return
            }
            self.presenter?.interactorPushLastestMovie(recevideData: movie ?? [])
        })
    }
    
    
}

extension HomeViewInteractor: HomeViewInteractorOutputProtocol {
    func interactorPushDataPresenter(recevideData: [Domain.Movie]) {
        presenter?.interactorPushDataPresenter(recevideData: recevideData)
    }
    
    func interactorPushLastestMovie(recevideData: [Domain.Movie]) {
        presenter?.interactorPushTopRateMovie(recevideData: recevideData)
    }
    
    func interactorPushTopRateMovie(recevideData: [Domain.Movie]) {
        presenter?.interactorPushTopRateMovie(recevideData: recevideData)
    }
    
    func interactorPushPopularMovie(recevideData: [Domain.Movie]) {
        presenter?.interactorPushTopRateMovie(recevideData: recevideData)
    }
    
    func moviesFetchFailed() {
        presenter?.moviesFetchFailed()
    }
    
    

    
    
}
