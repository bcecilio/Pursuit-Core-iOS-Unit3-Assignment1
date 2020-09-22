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
    
    var stockInfo = [StocksData]()
    
    var stockSections = [[StocksData]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        loadData()
        getSessions(data: stockInfo)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let StockDetailController = segue.destination as? StocksDetailController, let indexPath = tableView.indexPathForSelectedRow else {
            return
        }
        StockDetailController.stockDetail = stockSections[indexPath.section][indexPath.row]
    }
    
    func loadData() {
        stockInfo = StocksData.getStockInfo(from: Data.init())
    }
    
    func getSessions(data: [StocksData]) {
        let sortedStocks = data.sorted {$0.date < $1.date}
        var sectionNames = Set<String>(sortedStocks.map{$0.date})
        var removedDays = [String]()
        
        var sections: [[StocksData]]
        
        for stock in sectionNames {
            var removedDashesStock = stock.components(separatedBy: "-")
            removedDashesStock.removeLast()
            removedDays.append(removedDashesStock.joined(separator: " "))
        }
        sectionNames = Set(removedDays)
        let sectionNamesArr = Array(sectionNames).sorted()
        
        sections = Array(repeating: [StocksData](), count: sectionNames.count)
        
        var currentIndex = 0
        var sectionIndex = 0
        var currentSection = sectionNamesArr[sectionIndex]
        
        for stock in sortedStocks {
            var date = stock.date.components(separatedBy: "-")
            date.removeLast()
            let removedDate = date.joined(separator: " ")
            
            if removedDate == currentSection {
                sections[currentIndex].append(stock)
            } else {
                currentIndex += 1
                sectionIndex += 1
                currentSection = sectionNamesArr[sectionIndex]
                sections[currentIndex].append(stock)
            }
        }
        stockSections = sections
    }
}

extension StocksViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stockSections[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stockCell", for: indexPath)
        
        let stockCell = stockSections[indexPath.section][indexPath.row]
        cell.textLabel?.text = stockCell.label
        cell.detailTextLabel?.text = stockCell.open.description
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return stockSections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let stock = stockSections[section].first?.label.components(separatedBy: " ") else {
            return " "
        }
        let title = "\(stock[0]) - \(stock[2])"
        return title
    }

//    func tableView(_ tableView: UITableView, titleForHeaderInSection: Int) -> String? {
//        guard let stock = stockSections[section].first?.label.components(seperatedBy: " ") else {
//            return " "
//        }
//        let title = "\(stock[0] - stock[2])"
//        return title
//    }
}
