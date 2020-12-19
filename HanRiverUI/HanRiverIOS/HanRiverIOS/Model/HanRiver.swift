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
    var type : Int = 0
    @Published var temperature: Double = 0
    
    func encode(to encoder: Encoder) throws {
        //not Use
    }
    
    init() { }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        no_ = try container.decode(Int.self, forKey: .no_)
        //name = try container.decode(String.self, forKey: .name)
        name = typeToString(type: try container.decode(Int.self, forKey: .type))
        type = try container.decode(Int.self, forKey: .type)
        temperature = try container.decode(Double.self, forKey: .temperature)
    }
    
    enum CodingKeys: CodingKey {
        case no_, name, type, temperature
    }
    
    func typeToString(type: Int) -> String {
        var newName: String = ""
        
        switch type {
        case 1: newName = "탄    천"
            
        case 2: newName = "중랑천"
        
        case 3: newName = "안양천"
        
        case 4: newName = "선유도"
        
        case 5: newName = "한    강"
        
        default:
            newName = ""
        }
        
        return newName
    }
}
