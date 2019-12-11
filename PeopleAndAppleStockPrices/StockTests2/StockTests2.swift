//
//  StockTests2.swift
//  StockTests2
//
//  Created by Brendon Cecilio on 12/5/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import XCTest
@testable import PeopleAndAppleStockPrices

class StocksTests: XCTestCase {
    
    let filename = "applstockinfo"
    let ext = "json"

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testParseData() {
        let data = Bundle.parseData(filename: filename, ext: ext)
        XCTAssertNotNil(data)
    }
    
    func testFirstStockDate() {
        let data = Bundle.parseData(filename: filename, ext: ext)
        let date = StocksData.getStockInfo(from: data)
        let expectedFirstDate = "2017-08-29"
        let firstDate = date.first!
        
        XCTAssertEqual(firstDate.date, expectedFirstDate, "")
    }
}
