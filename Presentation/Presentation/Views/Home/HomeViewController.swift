//
//  HomeViewController.swift
//  NetflixClone
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 6/10/22.
//

import UIKit
import CoreLocation
import Domain
import Infraestructure

protocol NavigationToDetailProtocol {
    func navigateToDetail(movie: Domain.Movie?)
}

class HomeViewController: UIViewController, NavigationToDetailProtocol {
    
    let widthScreen = UIScreen.main.bounds.width
    let heigthScreen = UIScreen.main.bounds.height
    static let heightPoster: CGFloat = 200
    static let heightPosterSection: CGFloat = 40
    
    private var serviceMovie: MovieService?
    var presenter: HomeViewPresenterProtocol?
    
    var upcomingMovies = [Domain.Movie]()
    var lastedMovies = [Domain.Movie]()
    var popularMovies = [Domain.Movie]()
    var topRateMovies = [Domain.Movie]()
    
    private var upcomingMovieOperation: GetUpcomingMoviesOperation!
    private var getPopularMoviesOperation: GetPopularMoviesOperation!
    private var getTopRateMoviesOperation: GetTopRateMoviesOperation!
    private var getLatestMoviesOperation: GetLatestMoviesOperation!
    private var permissionChecker: LocationPermissionCheckerImpl!
    private let coreLocation: CLLocationManager = CLLocationManager()
    private var alertController: UIAlertController? = nil
    
    // MARK: - PROPERTIES VIEW
    
    let scrollView: UIScrollView = {
        let myScrollView = UIScrollView()
        myScrollView.translatesAutoresizingMaskIntoConstraints = false
        myScrollView.contentInsetAdjustmentBehavior = .never
        myScrollView.backgroundColor = .black
        return myScrollView
    }()
    var scrollContainer : UIStackView = {
        let mystack = UIStackView()
        mystack.translatesAutoresizingMaskIntoConstraints = false
        mystack.spacing = 20
        mystack.axis = .vertical
        mystack.backgroundColor = .black
        
        return mystack
    }()
    let imageHeader : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named:"alcarras")
        image.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 1.5).isActive = true
        image.backgroundColor = .black
        return image
    }()
    
    
    let myTable : UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.isScrollEnabled = false
        table.backgroundColor = .white
        table.rowHeight = 200
        table.accessibilityIdentifier = "MyMovieTable"
        table.separatorStyle = UITableViewCell.SeparatorStyle.none
        return table
    }()
    
    let myAlert : UIAlertController = {
        let alert = UIAlertController(title: "Error", message: "Problem Fetching movies", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler : nil))
        return alert
    }()
    
    let sectionTitle:  [String] = ["lastetMovie".localized(tableName: "Localizable"), "upcoming".localized(tableName: "Localizable"), "popular".localized(tableName: "Localizable"), "topRate".localized(tableName: "Localizable")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getAuthorization()
        setupView()
        coreLocation.delegate = self
    }
    
    
    func getAuthorization() {
        if coreLocation.authorizationStatus == CLAuthorizationStatus.notDetermined {
            coreLocation.requestAlwaysAuthorization()
        }else {
            setupTableView()
            presenter?.viewDidLoad()
        }
    }
    
    func setupTableView() {
        myTable.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        DispatchQueue.main.async {
            self.myTable.dataSource = self
            self.myTable.delegate = self
            let num = self.numberOfSections(in: self.myTable)
            let heightAnchor = (HomeViewController.heightPoster + HomeViewController.heightPosterSection ) * CGFloat(num)
            self.myTable.heightAnchor.constraint(equalToConstant: heightAnchor).isActive = true
        }
        
    }

    func navigateToDetail(movie: Domain.Movie?) {
        guard let myMovie = movie else { return }
        presenter?.navigateToDetailView(with: myMovie)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        serviceMovie = nil
        alertController?.dismiss(animated: true)
        alertController = nil
    }
    
}


extension HomeViewController: HomeViewProtocol {
    
    func presenterPushDataViewUpComingMovies(receivedData: [Domain.Movie]) {
        upcomingMovies = receivedData
    }
    
    func presenterPushDataViewPopularMovies(receivedData: [Domain.Movie]) {
        popularMovies = receivedData
    }
    
    func presenterPushDataViewLastestMovies(receivedData: [Domain.Movie]) {
        lastedMovies = receivedData
    }
    
    func presenterPushDataViewTopRateMovies(receivedData: [Domain.Movie]) {
        topRateMovies = receivedData
        DispatchQueue.main.async {
            self.myTable.reloadData()
        }
    }
    
    func loadSpinner() {
        print("cargando")
    }
    
    func stopSpinner() {
        print("stop loading")
        DispatchQueue.main.async {
            self.myTable.reloadData()
        }
    }
    
    func showError() {
        DispatchQueue.main.async {
            if (!self.myAlert.isBeingPresented && !self.myAlert.isViewLoaded){
                self.present(self.myAlert, animated: true, completion: nil)
            }
            
        }

    }
}
