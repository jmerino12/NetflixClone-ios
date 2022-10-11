//
//  HomeViewController.swift
//  NetflixClone
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 6/10/22.
//

import UIKit

protocol NavigationToDetailProtocol {
    func navigateToDetail(movie: Movie)
}

class HomeViewController: UIViewController, NavigationToDetailProtocol {
    
    private let widthScreen = UIScreen.main.bounds.width
    private let heigthScreen = UIScreen.main.bounds.height
    // MARK: - PROPERTIES VIEW
    let scrollView = UIScrollView(frame: .zero)
    let scrollContainer = UIStackView()
    // ----------
    let contentImageHeader = UIView()
    let imageHeader = UIImageView()
    let tableView = UITableView(frame: .zero, style: .grouped)
    
    let titleLabel =  UILabel()
    
    let HEIGHT_POSTER: CGFloat = 200
    let HEIGHT_HEADER_SECTION: CGFloat = 40
    
    let sectionTitle:  [String] = ["Trending Movies", " Upcoming", "Popular", "Top Rate"]

 
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .black
        setupScrollView()
        setupConstraintsScrollView()
        setupScrollViewContainer()
        
        setupScrollViewConstraintsContainer()
        
        setupContentImageHeader()
        setupConstraintsImageHeader()
        
        setupImage()
        setupImageConstraints()
        
        setupTableView()
        setupConstrainstTableView()
        
        setupTitleMovie()
        
        AddGradient()
    }
    
    func setupScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentInsetAdjustmentBehavior = .never
       
        view.addSubview(scrollView)
    
    }
    
    func setupConstraintsScrollView() {
        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func setupScrollViewContainer() {
        scrollContainer.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(scrollContainer)
        scrollContainer.axis = .vertical
    }
    
    func setupScrollViewConstraintsContainer(){
        scrollContainer.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        scrollContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        scrollContainer.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        scrollContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        
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

 
    func setupContentImageHeader() {
        contentImageHeader.translatesAutoresizingMaskIntoConstraints = false
        scrollContainer.addArrangedSubview(contentImageHeader)
    }
    
    func setupConstraintsImageHeader() {
        contentImageHeader.heightAnchor.constraint(equalToConstant:heigthScreen / 1.5).isActive = true
        contentImageHeader.widthAnchor.constraint(equalTo: scrollContainer.widthAnchor).isActive = true
        contentImageHeader.topAnchor.constraint(equalTo: scrollContainer.topAnchor, constant: 0).isActive = true
    }
    
    
    func setupImage()  {
        imageHeader.translatesAutoresizingMaskIntoConstraints = false
        imageHeader.image = UIImage(named:"alcarras")
        
        contentImageHeader.addSubview(imageHeader)
    }
    
    func setupImageConstraints()  {
        imageHeader.heightAnchor.constraint(equalTo: contentImageHeader.heightAnchor, constant: 0).isActive = true
        imageHeader.widthAnchor.constraint(equalTo: contentImageHeader.widthAnchor, constant: 0).isActive = true
        imageHeader.topAnchor.constraint(equalTo: contentImageHeader.topAnchor, constant: 0).isActive = true
        imageHeader.trailingAnchor.constraint(equalTo: contentImageHeader.trailingAnchor, constant: 0).isActive = true
        imageHeader.leadingAnchor.constraint(equalTo: contentImageHeader.leadingAnchor, constant: 0).isActive = true
    }
    
    
    func setupTableView() {
        scrollContainer.addArrangedSubview(tableView)
    
        tableView.dataSource = self
        tableView.delegate = self
        tableView.isScrollEnabled = false
        tableView.backgroundColor = .black
        
        tableView.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        
    }
    
    func setupConstrainstTableView() {
        let num = numberOfSections(in: tableView)
        let heightAnchor = (CGFloat(num) * (HEIGHT_POSTER + HEIGHT_HEADER_SECTION + 40)) + contentImageHeader.frame.height
        
        tableView.centerXAnchor.constraint(equalTo: scrollContainer.centerXAnchor).isActive = true
        tableView.widthAnchor.constraint(equalTo: scrollContainer.widthAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: contentImageHeader.bottomAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: scrollContainer.bottomAnchor).isActive = true
        tableView.heightAnchor.constraint(equalToConstant: heightAnchor).isActive = true
        
    }
    
    func navigateToDetail(movie: Movie) {
        let detailScreen = DetailMovieViewController()
        detailScreen.movie = movie
        detailScreen.modalPresentationStyle = .popover
        self.present(detailScreen, animated: true, completion: nil)
    }

    func setupTitleMovie(){
        imageHeader.addSubview(titleLabel)
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
        switch indexPath.section {
        case 0:
            cell.configureTitles(movies: trendingMovies)
        case 1:
            cell.configureTitles(movies: moviesUpComing)
        case 2:
            cell.configureTitles(movies: popularMovies)
        case 3:
            cell.configureTitles(movies: topRate)
        default:
            cell.configureTitles(movies: topRate)
        }
        cell.backgroundColor = .black
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
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x + 20, y: header.bounds.origin.y, width: 100, height: header.bounds.height)
        header.textLabel?.textColor = .white
    }
        

}
