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
    
    func loadData<T: Codable>(model: T.Type) {
        let url = "http://localhost:9090/hanRiverById/29"
        let data = urlSessionData(url: url)
        if data.count > 0 {
            if let decodedResponse = try? JSONDecoder().decode(model.self, from: data) {
                print(decodedResponse)
            }
        }
    }
    
    
    func insert () {
        
    }
    func update () {
        
    }
    func delete() {
        
    }
}
