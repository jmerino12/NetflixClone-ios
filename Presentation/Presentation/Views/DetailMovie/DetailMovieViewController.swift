//
//  DetailMovieViewController.swift
//  NetflixClone
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 11/10/22.
//

import UIKit
import Domain

class DetailMovieViewController: UIViewController {    
    var movie: Domain.Movie?

    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var buttonPlay: UIButton!
    @IBOutlet weak var buttonDownload: UIButton!
    @IBOutlet weak var titleMovie: UILabel!
    @IBOutlet weak var descriptionMovie: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
   
        buttonPlay.layer.cornerRadius = 5
        buttonPlay.layer.borderWidth = 1
        buttonPlay.layer.borderColor = UIColor.black.cgColor
        
        buttonDownload.layer.cornerRadius = 5
        buttonDownload.layer.borderWidth = 1
        buttonDownload.layer.borderColor = UIColor.black.cgColor
        
        loadInfo()
 
    }
    
    func loadInfo()  {
        titleMovie.text = movie?.title
        descriptionMovie.text = movie?.overview
        guard let movieUrl =  movie?.backdrop_path else { return }
        posterImage.kf.indicatorType = .activity
        posterImage.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500/\(movieUrl)"), options: [
            .transition(.fade(1)),
        
            ]
        )
        posterImage.image = UIImage(named: movie?.backdrop_path ?? "")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
