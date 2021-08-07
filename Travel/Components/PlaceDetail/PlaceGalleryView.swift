//
//  PlaceGalleryView.swift
//  Travel
//
//  Created by Milad Golchinpour on 7/16/21.
//

import SwiftUI

/// Showing some images from selected place for help user better
struct PlaceGalleryView: View {
    var place: Place
    
    var body: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 300), spacing: 15)], spacing: 15) {
            ForEach(1...6, id: \.self) { num in
                Image("\(place.name.replacingOccurrences(of: " ", with: "-").lowercased())-\(num)")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(25)
                    .frame(maxHeight: .infinity, alignment: .center)
            }
        }
        .padding(.bottom, 50)
        .padding(.horizontal)
    }
}

struct PlaceGalleryView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceGalleryView(place: PlacesViewModel().recommended[0])
    }
}
