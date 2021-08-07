//
//  CategorySelector.swift
//  Travel
//
//  Created by Milad Golchinpour on 7/14/21.
//

import SwiftUI

/// Category picker and changing selected category views
struct CategorySelector: View {
    @ObservedObject var viewModel: PlacesViewModel
    
    var body: some View {
        Text("Category")
            .boldTitleStyle()
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(viewModel.categories, id: \.name) { category in
                    CategoryView(category: category)
                }
            }
            .padding(.horizontal)
        }
    }
}

struct CategorySelector_Previews: PreviewProvider {
    static var previews: some View {
        CategorySelector(viewModel: PlacesViewModel())
    }
}
