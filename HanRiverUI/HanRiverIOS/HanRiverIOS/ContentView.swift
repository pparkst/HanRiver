//
//  ContentView.swift
//  HanRiverIOS
//
//  Created by pparkst on 2020/11/20.
//  Copyright © 2020 pparkst. All rights reserved.
//

import SwiftUI

struct HanRiverResponse: Codable {
    var result: HanRiverInfo
}

//struct HanRiverInfo: Codable {
//    var no_ : Int
//    var name: String
//    var temperature: Int
//}

struct ContentView: View {
    //@State var result: HanRiverInfo =  HanRiverInfo(no_: 1, name: "", temperature: 0)
    @State var result: HanRiverInfo?
    @State private var test = ""
    
    func dataLoad(model: HanRiverInfo) {
        //DispatchQueue.main.async {
        print(model.temperature)
        self.result = model
        //}
    }
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text("\(result?.temperature ?? 0)")
                .font(.headline)
        }
        .onAppear(perform: getHanRiverInfo)
    }
    
//    func loadData(){
//        guard let url = URL(string: "http://localhost:9090/hanRiverById/29") else{
//            print("Invalid URL")
//            return
//        }
//
//        let request = URLRequest(url: url)
//
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            if let data = data {
//                //print(data)
//                if let decodedResponse = try? JSONDecoder().decode(HanRiverInfo.self, from: data) {
//                    print(decodedResponse)
//                    DispatchQueue.main.async {
//                        self.result = decodedResponse
//                    }
//                    return
//                }
//            }
//            print("fatch ERROR")
//        }.resume()
//    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

