//
//  UserTests.swift
//  DemoTests
//
//  Created by Victor Chen on 2019/10/20.
//  Copyright © 2019 Mt. Zendo All rights reserved.
//

import XCTest
import Demo
import CoreData
import Foundation

class UserTests: XCTestCase {

    var appDelegate: AppDelegate!
    override func setUp() {
        appDelegate = (UIApplication.shared.delegate as! AppDelegate)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAdds() {
        let mockUser = MockData.getUserMockData()
        User.adds(userArr: [mockUser])
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        let dob = mockUser["dob"] as! [String: Any]
        let date = dob["date"] as! String
        let email = mockUser["email"] as! String
        let login = mockUser["login"] as! [String: String]
        let password = login["password"]!
        request.sortDescriptors = [NSSortDescriptor(key: "name.firstName", ascending: true)]
        request.predicate = NSPredicate(format: "(login.password == %@) && (dob.date == %@) && (email == %@)", password, date, email)
        guard let resArray = try? appDelegate.persistentContainer.viewContext.fetch(request) else {
            XCTAssert(false)
            return
        }
        guard resArray.count == 1 else {
            XCTAssert(false)
            return
        }
        XCTAssert(resArray[0] is User)
    }

}
