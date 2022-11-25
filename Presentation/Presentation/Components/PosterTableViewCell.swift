//
//  PosterTableViewCell.swift
//  NetflixClone
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 10/10/22.
//

import UIKit
import Domain
import Kingfisher

class PosterTableViewCell: UICollectionViewCell {

    static let identifier = "PosterTableViewCell"
    var movie: Domain.Movie?
    let imagePoster = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imagePoster)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imagePoster.frame = contentView.bounds
    }
    
    func loadView() {
        guard let movieUrl =  movie?.poster_path != nil ? movie?.poster_path : movie?.backdrop_path else { return }
        imagePoster.kf.indicatorType = .activity
        imagePoster.backgroundColor = .white
        DispatchQueue.main.async {
            self.imagePoster.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/original/\(movieUrl)"), options: [
                .transition(.fade(1)),
                ]
            )
        }
    
    }
    
    
}
