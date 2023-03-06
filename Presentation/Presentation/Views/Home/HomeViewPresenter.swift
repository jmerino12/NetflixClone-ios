//
//  HomeViewPresenter.swift
//  Presentation
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 16/01/23.
//

import Foundation
import Domain

class HomeViewPresenter {
    weak var view: HomeViewProtocol?
    var interactor: HomeViewInteractorInputProtocol?
    var router: HomeViewRouterProtocol?
    private var queue : OperationQueue!
}



extension HomeViewPresenter: HomeViewPresenterProtocol {
    func viewDidLoad() {
        queue = OperationQueue()
        queue.maxConcurrentOperationCount = 1
        view?.loadSpinner()
        queue.addOperation {
            GetPopularMoviesOperation(self.interactor?.getPopularMovies()).start()
            GetUpcomingMoviesOperation(self.interactor?.getUpcomingMovies()).start()
            GetLatestMoviesOperation(  self.interactor?.getLastestMovies()).start()
            GetTopRateMoviesOperation(self.interactor?.getTopRateMovies()).start()
        }
        view?.stopSpinner()
    }
    
    func navigateToDetailView(with data: Domain.Movie) {
        router?.navigateToDetailView(from: view!, data: data)
    }
    
}

extension HomeViewPresenter: HomeViewInteractorOutputProtocol {
    
    func interactorPushDataPresenter(recevideData: [Domain.Movie]) {
        view?.presenterPushDataViewUpComingMovies(receivedData: recevideData)
    }
    
    func interactorPushLastestMovie(recevideData: [Domain.Movie]) {
        view?.presenterPushDataViewLastestMovies(receivedData: recevideData)
    }
    
    func interactorPushTopRateMovie(recevideData: [Domain.Movie]) {
        view?.presenterPushDataViewTopRateMovies(receivedData: recevideData)
    }
    
    func interactorPushPopularMovie(recevideData: [Domain.Movie]) {
        view?.presenterPushDataViewPopularMovies(receivedData: recevideData)
    }
    
    func moviesFetchFailed() {
        view?.stopSpinner()
        view?.showError()
    }
    

}
