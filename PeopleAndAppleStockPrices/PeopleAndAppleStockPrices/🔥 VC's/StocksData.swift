//
//  StocksData.swift
//  PeopleAndAppleStockPrices
//
//  Created by Brendon Cecilio on 12/3/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct StocksData: Decodable {
    
    let date: String
    let open: Double
    let close: Double
    let label: String
}

extension StocksData {
    static func getStockInfo(from data: Data) -> [StocksData] {
        var stocks = [StocksData]()
        guard let fileURL = Bundle.main.url(forResource: "applstockinfo", withExtension: "json") else {
            fatalError("could not locate json file")
        }
        
        do {
            let data = try Data(contentsOf: fileURL)
            let stockData = try JSONDecoder().decode([StocksData].self, from: data)
            stocks = stockData
        } catch {
            fatalError("failed to load contents \(error)!!")
        }
        return stocks
    }
}
