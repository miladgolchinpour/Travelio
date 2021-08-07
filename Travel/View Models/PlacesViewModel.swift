//
//  PlacesViewModel.swift
//  Travel
//
//  Created by Milad Golchinpour on 7/15/21.
//

import SwiftUI

/// Access to all places data
class PlacesViewModel: ObservableObject {
    @Published var categories: [Category] = Bundle.main.decode("categories.json")
    @Published var recommended: [Place] = Bundle.main.decode("recommended.json")
}
