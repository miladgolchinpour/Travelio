//
//  CategoryPlaces.swift
//  Travel
//
//  Created by Milad Golchinpour on 7/14/21.
//

import SwiftUI

/// Show all places included in a category array
struct CategoryPlaces: View {
    var category: Category
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(category.name)
                .boldTitleStyle()
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(category.items, id: \.name) { place in
                        PlaceCard(place: place)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

struct CategoryPlaces_Previews: PreviewProvider {
    static var previews: some View {
        CategoryPlaces(category: Category(name: "", icon: "", color: "pink", items: []))
    }
}
