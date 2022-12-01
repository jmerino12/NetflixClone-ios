//
//  HomeScreenTest.swift
//  NetflixClone-iosUITests
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 30/11/22.
//

import XCTest

final class HomeScreenTest: XCTestCase {
    
    func test_TypeAgeAndLoadMovie_success() {
        let app = XCUIApplication()
        app.launch()
        HomeScreen(app: app)
            .typeAge("18")
            .pressBottonAlert()
    }
    
    
    func test_TypeAgeAndLoadMovieShowMovieDetail_success() {
        let app = XCUIApplication()
        app.launch()
        try! HomeScreen(app: app)
            .typeAge("18")
            .pressBottonAlert()
            .pressMovieIndexFor(index: 1)
    }
    
    
}
