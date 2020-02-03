//
//  MockData.swift
//  DemoTests
//
//  Created by Victor Chen on 2019/10/20.
//  Copyright © 2019 Mt. Zendo All rights reserved.
//

import Foundation

class MockData {
    public static func getUserMockData() -> [String: Any] {
        var userDic = [String: Any]()
        userDic["gender"] = "female"
        userDic["email"] = "louane.vidal@example.com"
        userDic["phone"] = "02-62-35-18-98"
        userDic["cell"] = "06-07-80-83-11"
        userDic["name"] = getNameMockData()
        userDic["location"] = getLocationMockData()
        userDic["dob"] = getDOBMockData()
        userDic["registered"] = getRegisteredMockData()
        userDic["picture"] = getPictureMockData()
        userDic["login"] = getLoginMockData()
        return userDic
    }
    
    public static func getLoginMockData() -> [String: String] {
        var loginDic = [String: String]()
        loginDic["uuid"] = "9f07341f-c7e6-45b7-bab0-af6de5a4582d"
        loginDic["username"] = "angryostrich988"
        loginDic["password"] = "r2d2"
        return loginDic
    }
    
    public static func getNameMockData() -> [String: String] {
        var nameDic = [String: String]()
        nameDic["title"] = "Miss"
        nameDic["firstName"] = "Louane"
        nameDic["lastName"] = "Vidal"
        return nameDic
    }
    
    public static func getLocationMockData() -> [String: Any] {
        var locationDic = [String: Any]()
        locationDic["street"] = getStreetMockData()
        locationDic["coordinates"] = getCoordinateMockData()
        locationDic["timezone"] = getTimezoneMockData()
        locationDic["city"] = "Avignon"
        locationDic["state"] = "Vendée"
        locationDic["country"] = "France"
        locationDic["postcode"] = 78276
        
        return locationDic
    }
    
    public static func getTimezoneMockData() -> [String: String] {
        var timezone = [String: String]()
        timezone["offset"] = "+1:00"
        timezone["description"] = "Brussels, Copenhagen, Madrid, Paris"
        return timezone
    }
    
    public static func getStreetMockData() -> [String: Any] {
        var streetDic = [String: Any]()
        streetDic["number"] = 2479
        streetDic["names"] = "Place du 8 Février 1962"
        return streetDic
    }
    
    public static func getCoordinateMockData() -> [String: Double] {
        var coordinateDic = [String: Double]()
        coordinateDic["latitude"] = 2.0565
        coordinateDic["longitude"] = 95.2422
        return coordinateDic
    }
    
    public static func getDOBMockData() -> [String: Any] {
        var dobDic = [String: Any]()
        dobDic["date"] = "1966-06-26T11:50:25.558Z" 
        dobDic["age"] = 53 as Int32
        return dobDic
    }
    
    public static func getRegisteredMockData() -> [String: Any] {
        var registeredDic = [String: Any]()
        registeredDic["date"] = "2016-08-11T06:51:52.086Z"
        registeredDic["age"] = 3 as Int32
        return registeredDic
    }
    
    public static func getPictureMockData() -> [String: String] {
        var pictureDic = [String: String]()
        pictureDic["large"] = "https://randomuser.me/api/portraits/women/88.jpg"
        pictureDic["medium"] = "https://randomuser.me/api/portraits/med/women/88.jpg"
        pictureDic["thumbnail"] = "https://randomuser.me/api/portraits/thumb/women/88.jpg"
        return pictureDic
    }
}
