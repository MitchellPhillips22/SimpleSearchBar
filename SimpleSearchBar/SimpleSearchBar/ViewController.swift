//
//  ViewController.swift
//  SimpleSearchBar
//
//  Created by Mitchell Phillips on 3/21/16.
//  Copyright © 2016 Wasted Potential LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var tableView: UITableView!
    
    let citiesArray = ["Salt Lake City", "St. George", "Cedar City", "Lehi", "West Valley", "Magna", "Kearns", "Logan", "Layton"]
    
    var resultsArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        resultsArray = citiesArray
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")!
        
        cell.textLabel?.text = resultsArray[indexPath.row]
        
        return cell
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.resultsArray.count
        
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {

        restoreSearchBar("")
        print("cancel")
        
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        print("search did end")
        
    }
    func restoreSearchBar(searchText: String) {
        if searchText == "" {
            self.searchBar.text = ""
            self.resultsArray = self.citiesArray
            self.tableView.reloadData()
            self.searchBar.resignFirstResponder()
        }
        
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        
        self.resultsArray.removeAll()
    
        for city in self.citiesArray {
            
            if city.lowercaseString.hasPrefix(searchText.lowercaseString) {
                
                self.resultsArray.append(city)
                
                print(resultsArray)
            }
            tableView.reloadData()  
        }
        restoreSearchBar(searchText)
    }

    
    func containsString(str: String, searchText: String) -> Bool {
        
        let lowercaseString = str.lowercaseString
        
        let lowercaseSearchText = searchText.lowercaseString
        
        return lowercaseString.hasPrefix(lowercaseSearchText)
    }
}

