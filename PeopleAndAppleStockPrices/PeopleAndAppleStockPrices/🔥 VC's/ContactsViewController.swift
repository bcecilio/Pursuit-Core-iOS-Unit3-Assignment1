//
//  ContactsViewController.swift
//  PeopleAndAppleStockPrices
//
//  Created by Brendon Cecilio on 12/3/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class ContactsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var userInfo = [UserInfo]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    var searchQuery = "" {
        didSet {
            searchBarQuery()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        searchBar.delegate = self
        loadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let ContactDetailViewController = segue.destination as? ContactsDetailController, let indexPath = tableView.indexPathForSelectedRow else {
            return
        }
        ContactDetailViewController.contactDetail = userInfo[indexPath.row]
    }
    
    func loadData() {
        userInfo = UserData.getUserInfo(from: Data.init())
    }
    
    func searchBarQuery() {
        userInfo = UserData.getUserInfo(from: Data.init()).filter {$0.fullName.lowercased().contains(searchQuery.lowercased())}
    }
}

extension ContactsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactsCell", for: indexPath)
        
        let userCell = userInfo[indexPath.row]
        cell.textLabel?.text = userCell.fullName.capitalized
        cell.detailTextLabel?.text = userCell.location.city.capitalized
        
        return cell
    }
}

extension ContactsViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else {
                    searchBarQuery()
                    loadData()
                    return
                }
                searchQuery = searchText
    }
}
