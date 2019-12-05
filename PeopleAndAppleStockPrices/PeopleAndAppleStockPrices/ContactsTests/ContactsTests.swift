//
//  ContactsTests.swift
//  ContactsTests
//
//  Created by Brendon Cecilio on 12/3/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import XCTest
@testable import PeopleAndAppleStockPrices

class ContactsTests: XCTestCase {

    let filename = "userinfo"
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
    
    func testFirstUserInData() {
        let data = Bundle.parseData(filename: filename, ext: ext)
        let users = UserData.getUserInfo(from: data)
        let expectedFirstUser = "eugene"
        let firstUser = users.first!

        XCTAssertEqual(firstUser.name.first, expectedFirstUser, "")
    }
    
    func testGetFirstUserEmail() {
        let data = Bundle.parseData(filename: filename, ext: ext)
        let users = UserData.getUserInfo(from: data)
        let expectedFirstEmail = "eugene.henry@example.com"
        let firstEmail = users.first!
        
        XCTAssertEqual(firstEmail.email, expectedFirstEmail, "")
    }
}

extension UserData {
    func getRawData() -> Data {
        let filename = "userinfo"
        let ext = "json"
        let data = Bundle.parseData(filename: filename, ext: ext)
        return data
    }
    
//     func getUsers() -> [UserInfo] {
//        let data = getRawData()
//        let users = UserData.getUsers(from: data)
//        return users
//    }
}
