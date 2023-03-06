//
//  HomeViewRouter.swift
//  Presentation
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 16/01/23.
//

import Foundation
import UIKit
import Domain

class HomeViewRouter: HomeViewRouterProtocol {
    
    static func createHomeViewModule(movieService: MovieService) -> UIViewController {
        let view = HomeViewController()
        
        let presenter: HomeViewPresenterProtocol & HomeViewInteractorOutputProtocol = HomeViewPresenter()
        let interactor: HomeViewInteractorInputProtocol & HomeViewInteractorOutputProtocol = HomeViewInteractor(movieService: movieService)
        let router: HomeViewRouterProtocol = HomeViewRouter()
            
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
            
        return view
    }
    
    func navigateToDetailView(from view: HomeViewProtocol, data: Domain.Movie) {
        if let view = view as? UIViewController {
            let detailScreen = DetailMovieViewController()
            detailScreen.movie = data
            detailScreen.modalPresentationStyle = .popover
            view.present(detailScreen, animated: true)
        }
    }
    
    
}
