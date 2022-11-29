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
    
    private let widthScreen = UIScreen.main.bounds.width
    private let heigthScreen = UIScreen.main.bounds.height
    private let HEIGHT_POSTER: CGFloat = 200
    private let HEIGHT_HEADER_SECTION: CGFloat = 40
    
    
    private var movieProxy: MovieProxy? = MovieProxy(movieApiRepository: MovieApiRepositoryImpl(), movieLocalRepository: MovieLocalRepositoryImpl(coreData: AppDelegate.sharedAppDelegate.coreDataStack))
    
    
    private var upcomingMovieOperation: GetUpcomingMoviesOperation!
    private var getPopularMoviesOperation: GetPopularMoviesOperation!
    private var getTopRateMoviesOperation: GetTopRateMoviesOperation!
    private var getLatestMoviesOperation: GetLatestMoviesOperation!
    private var queue : OperationQueue!
    private var permissionChecker: LocationPermissionCheckerImpl!
    private let coreLocation: CLLocationManager = CLLocationManager()
    
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
    
    let sectionTitle:  [String] = ["lastetMovie".localized(tableName: "Localizable"), "upcoming".localized(tableName: "Localizable"), "popular".localized(tableName: "Localizable"), "topRate".localized(tableName: "Localizable")]

 
    override func viewDidLoad() {
        
        super.viewDidLoad()
        coreLocation.delegate = self
        queue = OperationQueue()
        queue.maxConcurrentOperationCount = 1
        view.backgroundColor = .black
        setupScrollView()
        setContraintsScrollView()
        setupScrollViewContainer()
        setContrainstsScrollViewContainer()
        AddGradient()
        getAuthorization()
        
    }
    
    
    func getAuthorization() {
        if coreLocation.authorizationStatus == CLAuthorizationStatus.notDetermined {
            coreLocation.requestAlwaysAuthorization()
        }else {
            setupTableView()
        }
    }
    
    
    func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
    }
    func setContraintsScrollView() {
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
    }
    
    func setupScrollViewContainer() {
        scrollView.addSubview(scrollContainer)
        scrollContainer.addArrangedSubview(imageHeader)
        scrollContainer.addArrangedSubview(myTable)

    }
    
    func setContrainstsScrollViewContainer(){
        scrollContainer.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        scrollContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant:  -90).isActive = true
        scrollContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        scrollContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        scrollContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
    }
    
    func setupTableView() {
        myTable.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        DispatchQueue.main.async {
            self.myTable.dataSource = self
            self.myTable.delegate = self
            let num = self.numberOfSections(in: self.myTable)
            let heightAnchor = (self.HEIGHT_POSTER + self.HEIGHT_HEADER_SECTION ) * CGFloat(num)
            self.myTable.heightAnchor.constraint(equalToConstant: heightAnchor).isActive = true
        }

    }
    

    func AddGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.black.cgColor
        ]
        gradientLayer.frame = CGRect(x: 0, y: 0, width: widthScreen, height: heigthScreen / 1.5)
        imageHeader.layer.addSublayer(gradientLayer)
    }
    
    func navigateToDetail(movie: Domain.Movie?) {
        let detailScreen = DetailMovieViewController()
        detailScreen.movie = movie
        detailScreen.modalPresentationStyle = .popover
        self.present(detailScreen, animated: true, completion: nil)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        queue.cancelAllOperations()
        movieProxy = nil
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else { return UITableViewCell() }
        cell.delegate = self
        cell.clipsToBounds = true
        switch indexPath.section {
        case 0:
            
            getLatestMoviesOperation = GetLatestMoviesOperation(movieProxy: self.movieProxy!, completion: { movie in
                cell.configureTitles(movies: movie!)
            })
            queue.addOperation(getLatestMoviesOperation)

        case 1:
            
            upcomingMovieOperation = GetUpcomingMoviesOperation(movieProxy: self.movieProxy!, completion: { movie in
                cell.configureTitles(movies: movie!)
            })
            queue.addOperation(upcomingMovieOperation)
         
        case 2:
            getPopularMoviesOperation = GetPopularMoviesOperation(movieProxy: self.movieProxy!, completion: { movie in
                cell.configureTitles(movies: movie!)
            })
            queue.addOperation(getPopularMoviesOperation)
        case 3:
            getTopRateMoviesOperation = GetTopRateMoviesOperation(movieProxy: self.movieProxy!, completion: { movie in
                cell.configureTitles(movies: movie!)
            })
            queue.addOperation(getTopRateMoviesOperation)
        default:
            upcomingMovieOperation = GetUpcomingMoviesOperation(movieProxy: self.movieProxy!, completion: { movie in
                cell.configureTitles(movies: movie!)
            })
            queue.addOperation(upcomingMovieOperation)
        }
        
       
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return HEIGHT_POSTER
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return HEIGHT_HEADER_SECTION
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitle[section]
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        header.contentView.backgroundColor = .black
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x + 20, y: header.bounds.origin.y, width: 100, height: header.bounds.height)
        header.textLabel?.textColor = .white
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.0
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
}

extension HomeViewController : CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        getAuthorization()
    }
}
