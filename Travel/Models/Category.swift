//
//  Category.swift
//  Travel
//
//  Created by Milad Golchinpour on 7/14/21.
//

import SwiftUI

/// Category Model
struct Category: Codable {
    var name: String
    var icon: String
    var color: String
    var items: [Place]
}
