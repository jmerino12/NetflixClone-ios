//
//  PosterTableViewCell.swift
//  NetflixClone
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 10/10/22.
//

import UIKit

class PosterTableViewCell: UICollectionViewCell {

    static let identifier = "PosterTableViewCell"
    var movie: Movie?
    let imagePoster = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .black
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
        imagePoster.image = UIImage(named: movie?.backdrop_path ?? "")
    }
    
    
}
