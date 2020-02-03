//
//  DataServiceTest.swift
//  DemoTests
//
//  Created by Victor Chen on 2019/10/21.
//  Copyright © 2019 Mt. Zendo All rights reserved.
//

import XCTest
import Demo

class DataServiceTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testFetchApiPaginationData() {
        let expctation = self.expectation(description: "getPageData")
        DataService.fetchPaginationData {
            expctation.fulfill()
        }
        self.waitForExpectations(timeout: 10) { (error) in
            XCTAssertNil(error)
        }
    }

}
