//
//  URLSession.swift
//  HanRiverIOS
//
//  Created by pparkst on 2020/11/29.
//  Copyright © 2020 pparkst. All rights reserved.
//

import Foundation

func urlSessionData(url: String) -> Data {
    var res = Data()
    guard let url = URL(string: "\(url)") else {
        return res
    }
    
    let request = URLRequest(url: url)
    URLSession.shared.dataTask(with: request) { data, response, error in
        if let data = data {
                res = data
        }
        print("data nil")
    }.resume()
    print("out Session")
    return res
}


