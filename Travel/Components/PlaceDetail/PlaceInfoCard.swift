//
//  PlaceInfoCard.swift
//  Travel
//
//  Created by Milad Golchinpour on 7/15/21.
//

import SwiftUI

/// Place information included place name, country and rate
struct PlaceInfoCard: View {
    var place: Place
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(place.name)
                .font(.headline)
            
            HStack {
                Image(systemName: "location.fill")
                    .foregroundColor(.mint)
                
                Text(place.country)
            }
            
            HStack {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                
                Text("\(place.rate, specifier: "%.1f")")
            }
        }
        .padding()
        .background(.bar)
        .cornerRadius(15)
    }
}

struct PlaceInfoCard_Previews: PreviewProvider {
    static var previews: some View {
        PlaceInfoCard(place: PlacesViewModel().recommended[0])
    }
}
