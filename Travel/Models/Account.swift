//
//  Account.swift
//  Travel
//
//  Created by Milad Golchinpour on 7/13/21.
//

import SwiftUI

/// Account Model
struct Account: Identifiable {
    var id: String = ""
    var name: String
    var email: String
    var password: String = ""
}
