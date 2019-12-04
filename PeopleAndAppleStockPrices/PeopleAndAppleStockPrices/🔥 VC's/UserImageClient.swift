//
//  UserImageClient.swift
//  PeopleAndAppleStockPrices
//
//  Created by Brendon Cecilio on 12/4/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

struct ImageClient {
    static func fetchImage(for urlString: String, completion: @escaping (Result<UIImage?, Error>) -> ()){
        guard let url = URL(string: urlString) else {
            print("bad url \(urlString)")
            return
        }
        let dataTask = URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            if let error = error {
                print("")
            }
            if let data = data {
                let image = UIImage(data: data)
                completion(.success(image))
            }
        }
        dataTask.resume()
    }
}
