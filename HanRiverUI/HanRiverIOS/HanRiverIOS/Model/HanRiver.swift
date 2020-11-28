//
//  HanRiver.swift
//  HanRiverIOS
//
//  Created by pparkst on 2020/11/22.
//  Copyright © 2020 pparkst. All rights reserved.
//

import Foundation
import SwiftUI

class HanRiverInfo: Identifiable, ObservableObject, Codable {
    var no_ : Int = 0
    var name: String = ""
    //var temperature: Int
    @Published var temperature: Int = 0
    
    func encode(to encoder: Encoder) throws {
        //not Use
    }
    
    init() { }
//    init (no_: Int, name: String, temperature: Int) {
//        self.no_ = no_
//        self.name = name
//        self.temperature = temperature
//    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        no_ = try container.decode(Int.self, forKey: .no_)
        name = try container.decode(String.self, forKey: .name)
        temperature = try container.decode(Int.self, forKey: .temperature)
    }
    
    enum CodingKeys: CodingKey {
        case no_, name, temperature
    }
}
