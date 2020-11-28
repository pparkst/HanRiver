//
//  ContentView.swift
//  HanRiverIOS
//
//  Created by pparkst on 2020/11/20.
//  Copyright © 2020 pparkst. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var store: HanRiverStore

    @State private var result: HanRiverInfo?
    @State private var test = ""
    
    var body: some View {
//        VStack(alignment: .leading) {
//            Text("\(self.result?.temperature ?? 0)")
//            //Text("\(result.temperature)")
//                .font(.headline)
//        }
//        .onAppear(perform: getHanRiverInfo)
        //.onAppear()
        
        Text("\(store.hanRiverInfo.temperature)")
            .onAppear(perform: getHanRiverInfo)
            //.onAppear(perform: store.)
    }
    
    func dataLoad(model: HanRiverInfo) {
        //DispatchQueue.main.async {
        //print(model.temperature)
        print("\(model.no_) " + model.name + " \(model.temperature)")
        self.result = model
        //}
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
        //ContentView(res: HanRiverInfo(no_: 1, name: "", temperature: 11))
        ContentView()
        .environmentObject(HanRiverStore())
    }
}

