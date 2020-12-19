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
                                ForEach(store.hanRiverInfo) { row in
                                    (Text(row.name + String(format: "  %.1f", (row.temperature)))
                                     .font(.system(size: 60))
                                     +
                                        Text(" ℃").font(.system(size: 40)))
                                        //.background(Rectangle().stroke())
                                        .padding([.bottom], 20)
                                        .offset(x:10, y:250)
                            }
                            .frame(width: UIScreen.main.bounds.width,
                                        height: UIScreen.main.bounds.height
                                        )
                        )
                        .padding(.bottom, 200).overlay(
                            Button(action: { self.setNotification() }){
                                //Text("SET Notification!")
                            }.offset(x:0, y:370)
                        )
            )
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        //.opacity(0.2)
        .animation(.easeInOut(duration: 1.0))
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



