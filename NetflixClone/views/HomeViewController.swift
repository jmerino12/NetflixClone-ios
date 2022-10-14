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
    private let HEIGHT_POSTER: CGFloat = 200
    private let HEIGHT_HEADER_SECTION: CGFloat = 40
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
        mystack.spacing = 10
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
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.isScrollEnabled = false
        table.backgroundColor = .black
        table.separatorStyle = UITableViewCell.SeparatorStyle.none
        table.rowHeight = 200
    
        return table
    }()
    
    
    

    
    let sectionTitle:  [String] = ["Trending Movies", " Upcoming", "Popular", "Top Rate"]

 
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .black
    
        setupScrollView()
        setContraintsScrollView()
        setupScrollViewContainer()
        setContrainstsScrollViewContainer()
        
        setupTableView()
        
        AddGradient()

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
        myTable.dataSource = self
        myTable.delegate = self
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
    
    func navigateToDetail(movie: Movie) {
        let detailScreen = DetailMovieViewController()
        detailScreen.movie = movie
        detailScreen.modalPresentationStyle = .popover
        self.present(detailScreen, animated: true, completion: nil)
    }

    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let num = numberOfSections(in: myTable)
        let heightAnchor = (HEIGHT_POSTER + HEIGHT_HEADER_SECTION) * CGFloat(num)
        myTable.heightAnchor.constraint(equalToConstant: heightAnchor).isActive = true
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
        cell.separatorInset = .zero
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
        header.contentView.backgroundColor = .black
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x + 20, y: header.bounds.origin.y, width: 100, height: header.bounds.height)
            header.textLabel?.textColor = .white
    }
    
    
}
