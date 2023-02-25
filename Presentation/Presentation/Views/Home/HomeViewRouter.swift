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
        let interactor: HomeViewInteractorInputProtocol & HomeViewDataManagerOutputProtocol = HomeViewInteractor()
        let dataManager: HomeViewDataManagerInputProtocol = HomeDataManager(movieService: movieService )
        let wireFrame: HomeViewRouterProtocol = HomeViewRouter()
            
        view.presenter = presenter
        presenter.view = view
        presenter.router = wireFrame
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.datamanger = dataManager
        dataManager.dataManager = interactor
        
            
        return view
    }
    
    func navigateToDetailView(from view: HomeViewProtocol, data: Domain.Movie) {
        print(data)
    }
    
    
}
