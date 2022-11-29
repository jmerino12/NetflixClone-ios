//
//  NetflixClone_iosUITestsLaunchTests.swift
//  NetflixClone-iosUITests
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 25/11/22.
//

import XCTest
import SwiftMonkey

final class NetflixClone_iosUITestsLaunchTests: XCTestCase {
    
    func testSelectSecondTabbarItem() throws {
        let app = XCUIApplication()
        app.launch()
        
        let tabBarsQuery = app.tabBars
        
        tabBarsQuery.buttons.element(boundBy: 1).tap()
        
    }
    
    func test_tapMovieAndShowDetail_successful() throws {
        let app = XCUIApplication()
        app.launch()
        
        app.tables["MyMovieTable"].cells.element(boundBy: 0).tap()
        
    }
    
    func testMonkey() {
        let application = XCUIApplication()
        
        application.activate()

        let monkey = Monkey(frame: application.frame)

        
        // after Xcode 10.1 We can only use public API
        monkey.addDefaultXCTestPublicActions(app: application)
        
        monkey.addXCTestTapAlertAction(interval: 100, application: application)

        // Run the monkey test indefinitely.
        monkey.monkeyAround()
    }
}
