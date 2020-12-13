//
//  SplashView.swift
//  HanRiverIOS
//
//  Created by pparkst on 2020/12/08.
//  Copyright © 2020 pparkst. All rights reserved.
//

import Foundation
import SwiftUI

struct SplashView: View {
    
    @State var isActivate: Bool = false
    
    
    var body: some View {
        VStack {
            
            if self.isActivate {
                ContentView().environmentObject(HanRiverStore())
                    //.animation(Animation.easeOut.delay(0.5))
                
            }else {
                
                Image("logo3")
                    .resizable()
                    .clipShape(Circle())
                    .frame(width:100, height: 100)
                    

                    
                Text("Han ℃")
                .font(Font.largeTitle)    
                .foregroundColor(.white)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.blue.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/))
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                withAnimation {
                    self.isActivate = true
                }
            }
        }
    }
}


struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
