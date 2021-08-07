//
//  AppSettings.swift
//  Travel
//
//  Created by Milad Golchinpour on 7/13/21.
//

import Foundation
import SwiftUI

/// Shared variables between views
class AppSettings: ObservableObject {
    // MARK: Login, Welcome, account
    @AppStorage("isShowingWelcome") var isShowingWelcome: Bool = true
    
    // MARK: Checking account
    @Published var haveAccount: Bool = false
    
    // MARK: For showing success alert when signed in
    @Published var successLogin: Bool? = nil
    
    // MARK: Selected category in the home view
    @Published var selectedCategory: Category = PlacesViewModel().categories[0]
}
