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

    var body: some View {
        VStack(alignment: .leading) {
            Text("\(store.hanRiverInfo.temperature)")
                .font(.headline)
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

