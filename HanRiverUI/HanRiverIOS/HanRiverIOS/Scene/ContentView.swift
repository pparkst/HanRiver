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
    @State private var coffee: Bool = true
    var body: some View {
        VStack(alignment: .leading) {
            Image("korea_hanRiver_4")
            .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
                .overlay(
                    EmitterView()
                        .overlay(
                            Text("\(store.hanRiverInfo.temperature) ℃")
                            .font(.system(size: 60))
                    )
            )
            
        }
        .onAppear(perform: store.loadData)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        .environmentObject(HanRiverStore())
    }
}



