//
//  BuildView.swift
//  Presentation
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 6/03/23.
//

import Foundation

protocol BuildView {
    func buildViewHierarchy()
    func setupConstraints()
    func setupAdditionalConfiguration()
    func setupView()
}

extension BuildView {

    func setupView() {
        buildViewHierarchy()
        setupConstraints()
        setupAdditionalConfiguration()
    }
}
