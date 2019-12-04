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
            let filename = "userinfo"
            let ext = "json"
            let data = Bundle.parseData(filename: filename, ext: ext)
            let users = UserData.getUserInfo(from: data).filter {$0.fullName.lowercased().contains(searchQuery.lowercased())}
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
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
}

extension ContactsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactsCell", for: indexPath)
        
        let userCell = userInfo[indexPath.row]
        cell.textLabel?.text = userCell.fullName
        cell.detailTextLabel?.text = userCell.location.city
        
        return cell
    }
}

extension ContactsViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    }
}
