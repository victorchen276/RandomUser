//
//  DetailController.swift
//  Demo
//
//  Created by Victor Chen on 2019/10/20.
//  Copyright © 2019 Mt. Zendo All rights reserved.
//

import UIKit

class DetailController: UITableViewController {

    var user: User!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DetailCellType.totalCount.rawValue
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DetailCellType.reusedIDs[indexPath.row]) as! BaseCell
        cell.setupData(user)
        return cell
    }
}
