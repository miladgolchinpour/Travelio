//
//  ContentView.swift
//  Travel
//
//  Created by Milad Golchinpour on 7/12/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var appSettings: AppSettings

    var body: some View {
        NavigationView {
            if appSettings.isShowingWelcome {
                WelcomeView()
                    .navigationBarHidden(true)
                    .transition(.asymmetric(insertion: AnyTransition.opacity, removal: AnyTransition.opacity))
            } else {
                VStack {
                    HomeView()
                }
                .navigationBarHidden(true)
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
