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
    @State private var isActivate: Bool = true
    @State private var overlayOpacity: Double = 0.0
    
    func setNotification() {
        let manager = LocalNotificationManager()
        manager.addNotification(title: "This is a test reminder")
        manager.schedule()
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Image("backGround")
            .resizable()
                //.aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
                .overlay(
                    EmitterView()
                        .aspectRatio(contentMode: .fill)
                        .edgesIgnoringSafeArea(.all)
                        .overlay(
                            //Text("\(store.hanRiverInfo.temperature) ℃")
                           (Text(String(format: "%.1f", (store.hanRiverInfo.temperature)))
                            .font(.system(size: 60))
                            + //Text(" ℃").font(.system(size: 40)))
                            Text(" ℃").font(.system(size: 40)))
                            .offset(x:10, y:-150)
                        ).overlay(
                            Button(action: { self.setNotification() }){
                                //Text("SET Notification!")
                            }.offset(x:0, y:370)
                        )
            )
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        //.opacity(0.2)
        .animation(.easeInOut(duration: 2.0))
        //.transition(.move(edge: .bottom))
            //.animation(.spring())
        //.transition(.scale)
        //.animation(Animation.spring().delay(0.4))
        
        .onAppear(perform: store.loadData)
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//        .environmentObject(HanRiverStore())
//    }
//}



