//
//  Review.swift
//  Travel
//
//  Created by Milad Golchinpour on 7/16/21.
//

import Foundation

/// Review Model
struct Review: Codable, Identifiable {
    var id = UUID().uuidString
    var username: String
    var userPhotoURL: String
    var rate: Double = 5
    var comment: String
    var date: Date
}
