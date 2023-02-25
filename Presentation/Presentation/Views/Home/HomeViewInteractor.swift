//
//  HomeViewInteractor.swift
//  Presentation
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 16/01/23.
//

import Foundation
import Domain

class HomeViewInteractor: HomeViewInteractorInputProtocol {
    
    
    // MARK: Properties
    weak var presenter: HomeViewInteractorOutputProtocol?
    var datamanger: HomeViewDataManagerInputProtocol?
    
    func getData() {
        datamanger?.getUpcomingMovies()
        datamanger?.getLastestMovies()
        datamanger?.getPopularMovies()
        datamanger?.getTopRateMovies()
    }
}

extension HomeViewInteractor: HomeViewDataManagerOutputProtocol {

    
    func getUpcomingMoviesFromDataManager(with movies: [Domain.Movie]) {
        presenter?.interactorPushDataPresenter(recevideData: movies)
    }
    
    func getPopularMoviesFromDataManager(with movies: [Domain.Movie]) {
        presenter?.interactorPushPopularMovie(recevideData: movies)
    }
    
    func getLastestMoviesManager(with movies: [Domain.Movie]) {
        presenter?.interactorPushLastestMovie(recevideData: movies)
    }
    
    func getTopRateMoviesManager(with movies: [Domain.Movie]) {
        presenter?.interactorPushTopRateMovie(recevideData: movies)
    }
    
}
