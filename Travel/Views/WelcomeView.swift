//
//  WelcomeView.swift
//  Travel
//
//  Created by Milad Golchinpour on 7/12/21.
//

import SwiftUI

struct WelcomeView: View {
    @State private var showIcon = false
    @State private var showText = false
    @State private var showButton = false
    
    var body: some View {
        ZStack {
            Image("BackgroundW")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                if showIcon {
                    Image("icon")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 180)
                        .transition(.opacity)
                }
                
                Rectangle().frame(height: (UIScreen.main.bounds.width/2)/2).hidden()
                
                VStack(alignment: .leading) {
                    if showText {
                        Text("Welcome")
                            .foregroundColor(.white)
                            .font(.system(size: 50, weight: .semibold, design: .rounded))
                            .transition(.scale)
                    }
                    
                    if showButton {
                        StartDiscoveringButton {
                            withAnimation(.easeInOut(duration: 0.6)) { showIcon = false }
                            withAnimation(.easeInOut(duration: 0.6).delay(0.3)) { showText = false }
                            withAnimation(.easeInOut(duration: 0.6).delay(0.2)) { showButton = false }
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(30)
                
                Spacer()
            }
            
            if !showText && !showIcon && !showButton {
                FeaturesView()
                    .padding(30)
            }
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 0.6)) { showIcon = true }
            withAnimation(.easeInOut(duration: 0.6).delay(0.3)) { showText = true }
            withAnimation(.easeInOut(duration: 0.6).delay(1)) { showButton = true }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
