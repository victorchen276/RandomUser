//
//  DataService.swift
//  Demo
//
//  Created by Victor Chen on 2019/10/19.
//  Copyright © 2019 Mt. Zendo All rights reserved.
//

import Foundation
import Alamofire
import PKHUD

public class DataService {
    
    static var fetchPage = 1
    static public func fetchPaginationData(operation: () -> ()) {
        if fetchPage <= UserDefaults.cachedPage { // get cache
            operation()
            fetchPage += 1
        } else { // get API
            if try! Reachability().connection != .unavailable {
                fetchApiPaginationData(callBack: nil)
            }
        }
    }
    
    static public func fetchApiPaginationData(callBack: (() -> ())?) {
        HUD.show(.progress)
        let url = "https://randomuser.me/api/?page=\(fetchPage)&results=\(_pageCount)&seed=abc"
        Alamofire.request(url).responseJSON { (response) in
            HUD.hide()
            if callBack != nil {
                callBack!()
            }
            switch response.result {
            case .success:
                if let JSON = response.result.value as? [String: Any] {
                    let users = JSON["results"] as! [[String: Any]]
                    User.fetchRequest().fetchLimit = _pageCount
                    User.adds(userArr: users)
                    UserDefaults.cachedPage += 1
                    fetchPage += 1
                }
            case .failure: break
            }
        }
    }
}


