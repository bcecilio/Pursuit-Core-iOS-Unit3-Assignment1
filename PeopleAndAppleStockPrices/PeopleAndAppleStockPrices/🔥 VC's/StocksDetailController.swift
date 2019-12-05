//
//  StocksDetailController.swift
//  PeopleAndAppleStockPrices
//
//  Created by Brendon Cecilio on 12/3/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class StocksDetailController: UIViewController {
    
    @IBOutlet weak var imageVIew: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var openStockLabel: UILabel!
    @IBOutlet weak var closeStockLabel: UILabel!
    
    var stockDetail: StocksData!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        checkChange()
    }
    
    func updateUI() {
        guard let stockInfo = stockDetail else {
            fatalError("ha ha ha")
        }
        dateLabel.text = stockInfo.date
        openStockLabel.text = stockInfo.open.description
        closeStockLabel.text = stockInfo.close.description
    }
    
    func checkChange() {
        guard let stockInfo = stockDetail else {
            fatalError("ha ha ha")
        }
        
        if stockInfo.open > stockInfo.close {
            view.backgroundColor = .green
        } else if stockInfo.open < stockInfo.close {
            view.backgroundColor = .red
        }
    }
}
