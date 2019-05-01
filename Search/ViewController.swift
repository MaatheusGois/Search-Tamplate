//
//  ViewController.swift
//  Search
//
//  Created by Matheus Gois on 01/05/19.
//  Copyright © 2019 Matheus Gois. All rights reserved.
//

import UIKit

class ViewController: UIViewController,  UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating {
    let jobs:[String] = ["Boss", "Men", "Human", "Charmander", "Error"]
    
    @IBOutlet weak var tableView: UITableView!
    var filteredJobs = [String]()
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        filteredJobs = jobs
        
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        // If we haven't typed anything into the search bar then do not filter the results
        if searchController.searchBar.text! == "" {
            filteredJobs = jobs
        } else {
            // Filter the results
            filteredJobs = jobs.filter { $0.lowercased().contains(searchController.searchBar.text!.lowercased()) }
        }
        
        self.tableView.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredJobs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let UICell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "celulaStoryBord")!
        
        UICell.textLabel!.text = filteredJobs[indexPath.row]
        return UICell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }


}

