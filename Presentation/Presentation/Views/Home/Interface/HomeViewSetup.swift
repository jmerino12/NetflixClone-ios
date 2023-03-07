//
//  HomeViewSetup.swift
//  Presentation
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 6/03/23.
//

import UIKit

extension HomeViewController: BuildView {
    
    func buildViewHierarchy() {
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(scrollContainer)
        scrollContainer.addArrangedSubview(imageHeader)
        scrollContainer.addArrangedSubview(myTable)
    }
    
    func setupConstraints() {
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        
        scrollContainer.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        scrollContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant:  -90).isActive = true
        scrollContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        scrollContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        scrollContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
    }
    
    func setupAdditionalConfiguration() {
        view.backgroundColor = .black
        AddGradient()
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
    
}
