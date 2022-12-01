//
//  HomeScreen.swift
//  NetflixClone-iosUITests
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 30/11/22.
//

import Foundation
import XCTest

protocol Screen {
    var app: XCUIApplication { get }
}

struct HomeScreen: Screen {
    let app:XCUIApplication
    
    private enum Identifiers {
        static let age = "age"
        static let alertAge = "alertAge"
        static let acceptDialogAge = "aceptar"
        static let myTable = "MyMovieTable"
        static let myCollectionView = "CollectionViewTableViewCell"
    }
    
    func typeAge(_ myAge: String) -> Self {
        let age = app.textFields[Identifiers.age]
        age.tap()
        age.typeText(myAge)
        return self
    }
    
    func pressBottonAlert() -> Self {
        let alert = app.alerts[Identifiers.alertAge]
        let button = alert.buttons[Identifiers.acceptDialogAge]
        button.tap()
        return self
    }
    
    func pressTabBarIndex(index: Int) throws -> Self {
        let tabBarsQuery = app.tabBars
        tabBarsQuery.buttons.element(boundBy: index).tap()
        return self
    }
    
    func pressMovieIndexFor(index: Int) throws -> Self {
        app.tables[Identifiers.myTable].cells.element(boundBy: index).tap()
        return self
    }
    
    func verfiyLoadMovies() -> Self {
        let tableMovies = app.tables[Identifiers.myTable]
        let collectionView = tableMovies.collectionViews[Identifiers.myCollectionView]
        print(collectionView.cells["dsd"])
        return self
    }
}
