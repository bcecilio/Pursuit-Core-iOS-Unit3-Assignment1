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
    
//    var userInfo = [UserInfo]() {
//        didSet {
//            tableView.reloadData()
//        }
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//    }
//    
//    func loadData() {
//        
//    }
//}
//
//extension ContactsViewController: UITableViewDataSource {
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return userInfo.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath)
//        
//        let userCell = userInfo[indexPath.row]
//        cell.textLabel?.text = userCell.name.first
//        cell.detailTextLabel?.text = userCell.location.city
//        
//        return cell
//    }
}
