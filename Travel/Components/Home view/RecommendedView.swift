//
//  RecommendedView.swift
//  Travel
//
//  Created by Milad Golchinpour on 7/14/21.
//

import SwiftUI

/// All places of Recommended array
struct RecommendedView: View {
    @ObservedObject var viewModel: PlacesViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Recommended")
                .boldTitleStyle()
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(viewModel.recommended, id: \.name) { place in
                        PlaceCard(place: place)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

struct RecommendedView_Previews: PreviewProvider {
    static var previews: some View {
        RecommendedView(viewModel: PlacesViewModel())
    }
}
