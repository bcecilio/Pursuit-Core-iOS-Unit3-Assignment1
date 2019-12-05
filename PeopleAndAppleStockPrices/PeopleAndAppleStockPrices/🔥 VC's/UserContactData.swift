//
//  UserContactData.swift
//  PeopleAndAppleStockPrices
//
//  Created by Brendon Cecilio on 12/3/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct UserData: Decodable {
    let results: [UserInfo]
}

struct UserInfo: Decodable {
    let name: Name
    let location: Location
    var fullName: String { return name.first + " " + name.last }
    let email: String
    let phone: String
    let picture: Picture
}

struct Name: Decodable {
    let title: String
    let first: String
    let last: String
}

struct Location: Decodable {
    let street: String
    let city: String
    let state: String
    let postcode: String
}

struct Picture: Decodable {
    let large: String
}

extension UserData {
    static func getUserInfo(from data: Data) -> [UserInfo] {
        var users = [UserInfo]()
        
        guard let fileURL = Bundle.main.url(forResource: "userinfo", withExtension: "json") else {
            fatalError()
        }
        
        do {
            let data = try Data(contentsOf: fileURL)
            let userData = try JSONDecoder().decode(UserData.self, from: data)
            users = userData.results
        } catch {
            fatalError("failed to load contents \(error)!!")
        }
        return users
    }
}
