//
//  Context.swift
//  HanRiverIOS
//
//  Created by pparkst on 2020/11/22.
//  Copyright © 2020 pparkst. All rights reserved.
//

import Foundation
import SwiftUI
//http://localhost:9090/hanRiverById/29

//let A: HanRiverInfo = HanRiverInfo(no_: 1, name: "", temperature: 0)


func loadData<T: Codable>(url: String, model: T.Type) {
    print("loadData", url)
    //let defaultSession  = URLSession(configuration: .default)
    
    guard let url = URL(string: "\(url)") else{
        print("Invalid URL")
        return
    }
    
    let request = URLRequest(url: url)
    
    print(request)
    
//    let dataTask = defaultSession.dataTask(with: request) {
//        (data: Data?, response: URLResponse?, error: Error?) in
//        guard error == nil else {
//            print("Error occur: \(String(describing: error))")
//            return
//        }
//
//        guard let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 else {
//            return
//        }
//
//        //Request Success
//        //Json Seriallize and Convert swift dataType
//        guard let jsonToArray = try? JSONSerialization.jsonObject(with: data, options: []) else {
//            print("Json to Array Error")
//            return
//        }
//
//        print(jsonToArray)
//    }
//
//    dataTask.resume()
    
    URLSession.shared.dataTask(with: request) { data, response, error in
        print("URLSession")
        if let data = data {
            print(data)
            print(data.count)
            if let decodedResponse = try? JSONDecoder().decode(model.self, from: data) {
               DispatchQueue.main.async {
                    
                    print(decodedResponse)
                    //ContentView.result = decodedResponse as? HanRiverInfo
                    //result = decodedResponse
                    //ContentView().dataLoad(model: decodedResponse as! HanRiverInfo)
                    //ContentView(res: decodedResponse as! HanRiverInfo)
                    //ContentView(result: decodedResponse)
                }
                return
            }
        }
        print("fatch ERROR")
    }.resume()
    print("out URLSession")
    return
}


func getHanRiverInfo() {
    print("getHanRiverInfo")
    loadData(url: "http://localhost:9090/hanRiverById/29", model: HanRiverInfo.self)
}
