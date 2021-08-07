//
//  Place.swift
//  Travel
//
//  Created by Milad Golchinpour on 7/14/21.
//

import Foundation

/// Place Model
struct Place: Codable, Identifiable {
    var id: String? = UUID().uuidString
    var name: String
    var country: String
    var rate: Double
    var description: String
}
