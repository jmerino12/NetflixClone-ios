//
//  CollectionViewTableViewCell.swift
//  NetflixClone
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 10/10/22.
//

import UIKit

class CollectionViewTableViewCell: UITableViewCell {
    
    static let identifier = "CollectionViewTableViewCell"
    private var movies: [Movie] = [Movie]()
    var delegate: NavigationToDetailProtocol?
    
    private var collectionView: UICollectionView?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .black
        configureCollectionView()
        setCollectionConstrainst()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func configureCollectionView()  {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 140, height: 200)
        layout.scrollDirection = .horizontal
        
        collectionView = UICollectionView(frame: .zero , collectionViewLayout: layout)
        collectionView?.backgroundColor = .black
        collectionView?.register(PosterTableViewCell.self, forCellWithReuseIdentifier: PosterTableViewCell.identifier)
        collectionView?.showsHorizontalScrollIndicator = false
        contentView.addSubview(collectionView!)
        
        collectionView?.delegate = self
        collectionView?.dataSource = self
    }
    
    func setCollectionConstrainst() {
        
        collectionView?.translatesAutoresizingMaskIntoConstraints = false
        collectionView?.heightAnchor.constraint(equalTo: contentView.heightAnchor).isActive = true
        collectionView?.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        collectionView?.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        collectionView?.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    }
    
   /* override func layoutSubviews() {
        super.layoutSubviews()
        collectionView?.frame = contentView.bounds
    }*/
    
    func configureTitles(movies: [Movie]) {
        self.movies = movies
    }
    
}

extension CollectionViewTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PosterTableViewCell.identifier, for: indexPath) as? PosterTableViewCell
        cell?.movie = self.movies[indexPath.row]
        cell?.loadView()
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(movies[indexPath.row])
        delegate?.navigateToDetail(movie: movies[indexPath.row])
    }
    
    
    
}
