//
//  DownloadViewController.swift
//  NetflixClone
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 6/10/22.
//

import UIKit
import Alamofire

class DownloadViewController: UIViewController {
    
    let myLabel: UILabel = {
        let myLabel = UILabel()
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        myLabel.text = "myDownloads".localized(tableName: "DownloadScreen")
        myLabel.textColor = .white
        return myLabel
    }()
    
    let myImage : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named:"icon-download")
        image.backgroundColor = .white
        return image
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.addSubview(myLabel)
        myLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        myLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        
        view.addSubview(myImage)
        
        myImage.topAnchor.constraint(equalTo: myLabel.bottomAnchor).isActive = true
        myImage.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
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
