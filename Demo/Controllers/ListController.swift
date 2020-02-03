//
//  ViewController.swift
//  Demo
//
//  Created by Victor Chen on 18/10/19.
//  Copyright © 2019 Mt. Zendo All rights reserved.
//

import UIKit
import CoreData
import Alamofire

class ListController: UITableViewController {

    var fetchResultsController: NSFetchedResultsController<NSFetchRequestResult>!
    var searchController: UISearchController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchResultsController = NSFetchedResultsController(fetchRequest: User.fetchRequest(), managedObjectContext: _cdContext, sectionNameKeyPath: nil, cacheName: nil)
        fetchResultsController.delegate = self
        try? fetchResultsController.performFetch()
        DataService.fetchPaginationData {
            try? self.fetchResultsController.performFetch()
            tableView.reloadData()
        }
        
        searchController = UISearchController(searchResultsController: nil)
        searchController.delegate = self
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        tableView.tableHeaderView = searchController.searchBar
        tableView.estimatedRowHeight = CGFloat(_estimatedRowHeight)
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == DetailController.className, let cell = sender as? UITableViewCell {
            let des = segue.destination as! DetailController
            if let index = self.tableView.indexPath(for: cell), let user = self.fetchResultsController.object(at: index) as? User {
                des.user = user
            }
            searchController.dismiss(animated: false) { () -> Void in
                
            }
        }
    }

    @IBAction func loadMore(_ sender: UIBarButtonItem?) {
        DataService.fetchPaginationData {
            self.fetchResultsController.fetchRequest.fetchLimit = DataService.fetchPage * _pageCount
            try? self.fetchResultsController.performFetch()
            tableView.reloadData()
        }
    }
}

extension ListController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchResultsController.fetchedObjects?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BasicInfoCell.reusedID) as! BasicInfoCell
        let user = fetchResultsController.object(at: indexPath) as? User
        cell.setupData(user)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}

extension ListController: NSFetchedResultsControllerDelegate {
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            tableView.insertRows(at: [newIndexPath!], with: .automatic)
        case .delete:
            tableView.deleteRows(at: [indexPath!], with: .automatic)
        case .update:
            let cell = tableView.cellForRow(at: indexPath!) as! BasicInfoCell
            if let user = controller.object(at: indexPath!) as? User {
                cell.setupData(user)
            }
        case .move:
            tableView.deleteRows(at: [indexPath!], with: .automatic)
            tableView.insertRows(at: [newIndexPath!], with: .automatic)
        default:
            break
        }
    }
}

extension ListController: UISearchControllerDelegate, UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchText = searchController.searchBar.text ?? ""
        var predicate: NSPredicate?
        if searchText.count > 0 {
            predicate = NSPredicate(format: "(name.lastName contains [cd] %@) || (name.firstName contains [cd] %@) || (gender contains [cd] %@) || (dob.date contains [cd] %@) || (dob.age contains [cd] %@)", searchText, searchText, searchText, searchText, searchText)
        } else {
            predicate = nil
            fetchResultsController.fetchRequest.fetchLimit = (DataService.fetchPage - 1) * _pageCount
        }
        fetchResultsController.fetchRequest.predicate = predicate
        try? fetchResultsController.performFetch()
        tableView.reloadData()
    }
}

