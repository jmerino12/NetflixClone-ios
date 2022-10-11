//
//  MainTabBarViewController.swift
//  NetflixClone
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 6/10/22.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.barTintColor = UIColor(named: "blackBar")
        tabBar.tintColor = UIColor(named: "white")
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)

        
        configureTabBar()
        
    }
    
    func configureTabBar() {
        let homeViewController = UINavigationController(rootViewController: HomeViewController())
        let newAndPopularController = UINavigationController(rootViewController: NewAndPopularViewController())
        let toLaugthViewController = UINavigationController(rootViewController: ToLaughViewController())
        let downloadController = UINavigationController(rootViewController: DownloadViewController())
        
        
        homeViewController.title = "Inicio"
        newAndPopularController.title = "Nuevo y popular"
        toLaugthViewController.title = "Para reir"
        downloadController.title = "Descargas"
        
        homeViewController.tabBarItem.image = UIImage(systemName: "house")
        newAndPopularController.tabBarItem.image = UIImage(systemName: "play.circle.fill")
        toLaugthViewController.tabBarItem.image = UIImage(systemName: "flame")
        downloadController.tabBarItem.image = UIImage(systemName: "arrow.down.circle")
        
        homeViewController.navigationBar.isHidden = true
        newAndPopularController.navigationBar.isHidden = true
        toLaugthViewController.navigationBar.isHidden = true
        downloadController.navigationBar.isHidden = true
        
        
        setViewControllers([
            homeViewController,
            newAndPopularController,
            toLaugthViewController,
            downloadController
        ], animated: false)
        
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
