//
//  TravelApp.swift
//  Travel
//
//  Created by Milad Golchinpour on 7/12/21.
//

import SwiftUI
import Firebase

@main
struct TravelApp: App {
    
    @StateObject private var appSettings = AppSettings()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appSettings)
        }
    }
}
