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
            }else {
                Text("Loading App")
                .font(Font.largeTitle)
            }
        }
        .transition(.opacity)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation {
                    self.isActivate = true
                }
            }
        }
    }
}
