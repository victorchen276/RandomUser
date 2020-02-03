//
//  BaseManagedObjectTests.swift
//  DemoTests
//
//  Created by Victor Chen on 2019/10/21.
//  Copyright © 2019 Mt. Zendo All rights reserved.
//

import XCTest
import Demo

class BaseManagedObjectTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testInstance() {
        let user = User.instance()
        let name = Name.instance()
        XCTAssertTrue(user is User)
        XCTAssertTrue(name is Name)
    }
    
}
