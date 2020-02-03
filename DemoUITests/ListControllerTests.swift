//
//  ListControllerTests.swift
//  DemoUITests
//
//  Created by Victor Chen on 21/10/19.
//  Copyright © 2019 Mt. Zendo All rights reserved.
//

import XCTest

class ListControllerTests: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testLoadNextPage() {
        XCUIApplication().navigationBars["User list"].buttons["Next page"].tap()
    }
    
    func testGoToNextPage() {
        let app = XCUIApplication()
        app.tables.staticTexts["Martin Aubrey, female, 1955-04-29T11:58:30.868Z 64"].children(matching: .image).element.tap()
        app.navigationBars["User details"].buttons["User list"].tap()
    }
    
}

