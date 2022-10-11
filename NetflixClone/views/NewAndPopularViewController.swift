//
//  NewAndPopularViewController.swift
//  NetflixClone
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 6/10/22.
//

import UIKit

class NewAndPopularViewController: UIViewController {


    let scrollView: UIScrollView = {
           let scrollView = UIScrollView()
           scrollView.translatesAutoresizingMaskIntoConstraints = false
           return scrollView
       }()

       let scrollViewContainer: UIStackView = {
           let view = UIStackView()
           view.axis = .vertical
           view.spacing = 10
           view.translatesAutoresizingMaskIntoConstraints = false
           return view
       }()

       let redView: UIView = {
           let view = UIView()
           view.heightAnchor.constraint(equalToConstant: 500).isActive = true
           view.backgroundColor = .red
           return view
       }()

       let blueView: UIView = {
           let view = UIView()
           view.heightAnchor.constraint(equalToConstant: 200).isActive = true
           view.backgroundColor = .blue
           return view
       }()

       let greenView: UIView = {
           let view = UIView()
           view.heightAnchor.constraint(equalToConstant: 1200).isActive = true
           view.backgroundColor = .green
           return view
       }()

    


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        // ** SWAP VIEWS FOR WHAT YOU NEED HERE **
        scrollView.addSubview(scrollViewContainer)
        scrollViewContainer.addArrangedSubview(redView)
        scrollViewContainer.addArrangedSubview(blueView)
        scrollViewContainer.addArrangedSubview(greenView)

        scrollViewContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        scrollViewContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        scrollViewContainer.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        scrollViewContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        
        // THIS IS IMPORTANT FOR SCROLLING **LEAVE ALONE**
        scrollViewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true

    }
    
  
}
