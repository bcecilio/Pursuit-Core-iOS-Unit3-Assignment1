//
//  StocksViewController.swift
//  PeopleAndAppleStockPrices
//
//  Created by Brendon Cecilio on 12/3/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class StocksViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var stockInfo = [StocksData](){
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        loadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let StockDetailController = segue.destination as? StocksDetailController, let indexPath = tableView.indexPathForSelectedRow else {
            return
        }
        StockDetailController.stockDetail = stockInfo[indexPath.row]
    }
    
    func loadData() {
        stockInfo = StocksData.getStockInfo(from: Data.init())
    }
}

extension StocksViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stockInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stockCell", for: indexPath)
        
        let stockCell = stockInfo[indexPath.row]
        cell.textLabel?.text = stockCell.label
        cell.detailTextLabel?.text = stockCell.open.description
        return cell
    }
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return stockInfo.count
//    }
//
//    func tableViewHeader(_ tableView: UITableView, titleForHeaderInSection: Int) -> String? {
//
//    }
}
