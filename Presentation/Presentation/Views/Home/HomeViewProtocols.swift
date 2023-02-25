//
//  HomeViewProtocols.swift
//  Presentation
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 16/01/23.
//

import Foundation
import UIKit
import Domain

protocol HomeViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: HomeViewPresenterProtocol? { get set }
    func presenterPushDataViewUpComingMovies(receivedData : [Movie])
    func presenterPushDataViewPopularMovies(receivedData : [Movie])
    func presenterPushDataViewLastestMovies(receivedData : [Movie])
    func presenterPushDataViewTopRateMovies(receivedData : [Movie])
    
    func loadSpinner()
    func stopSpinner()
}

protocol HomeViewRouterProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createHomeViewModule(movieService: MovieService) -> UIViewController
    
    func navigateToDetailView(from view: HomeViewProtocol, data: Movie)
}

protocol HomeViewPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: HomeViewProtocol? { get set }
    var interactor: HomeViewInteractorInputProtocol? { get set }
    var router: HomeViewRouterProtocol? { get set }
    
    func viewDidLoad()
    func navigateToDetailView(with data: Movie)
}

protocol HomeViewInteractorOutputProtocol: AnyObject {
// INTERACTOR -> PRESENTER
    func interactorPushDataPresenter(recevideData: [Movie])
    
    func interactorPushLastestMovie(recevideData: [Movie])
    func interactorPushTopRateMovie(recevideData: [Movie])
    func interactorPushPopularMovie(recevideData: [Movie])
    
}

protocol HomeViewInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: HomeViewInteractorOutputProtocol? { get set }
    var datamanger: HomeViewDataManagerInputProtocol? { get set }
    
    func getData()
}

protocol HomeViewDataManagerInputProtocol: AnyObject {
    var dataManager: HomeViewDataManagerOutputProtocol? { get set}
    // Obtener peliclas
    func getUpcomingMovies()
    func getTopRateMovies()
    func getPopularMovies()
    func getLastestMovies()
}

protocol HomeViewDataManagerOutputProtocol: AnyObject {
    func getUpcomingMoviesFromDataManager(with movies: [Movie])
    func getPopularMoviesFromDataManager(with movies: [Movie])
    func getLastestMoviesManager(with movies: [Movie])
    func getTopRateMoviesManager(with movies: [Movie])
    
}
