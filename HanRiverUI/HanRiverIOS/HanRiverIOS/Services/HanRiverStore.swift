//
//  HanRiverStore.swift
//  HanRiverIOS
//
//  Created by pparkst on 2020/11/29.
//  Copyright © 2020 pparkst. All rights reserved.
//

import Foundation

class HanRiverStore: ObservableObject {
    @Published var hanRiverInfo: HanRiverInfo
    
    init() {
        hanRiverInfo = HanRiverInfo()
    }
    
    func loadData() {
        guard let url = URL(string: "\("http://localhost:9090/hanRiverFindLatest")") else {
            print("Invalid URL")
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(HanRiverInfo.self, from: data) {
                    print(decodedResponse.name)
                    print(decodedResponse.temperature)
                    DispatchQueue.main.async {
                        self.hanRiverInfo = decodedResponse
                    }
                    return
                }
            }
            print("data nil")
        }.resume()
    }
}
