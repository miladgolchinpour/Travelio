//
//  PlaceCard.swift
//  Travel
//
//  Created by Milad Golchinpour on 7/14/21.
//

import SwiftUI

struct PlaceCard: View {
    var place: Place
    
    var body: some View {
        NavigationLink(destination: PlaceDetail(place: place)) {
            ZStack(alignment: .bottomLeading) {
                Image(place.name)
                    .resizable()
                    .foregroundColor(.white)
                    .cornerRadius(30)
                
                VStack(alignment: .leading) {
                    Text(place.name)
                        .font(.footnote)
                        .bold()
                    
                    HStack {
                        Image(systemName: "location.fill")
                            .foregroundColor(.mint)
                        
                        Text(place.country)
                    }
                    .font(.caption)
                    
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        
                        Text("\(place.rate, specifier: "%.1f")")
                    }
                    .font(.caption)
                }
                .padding()
                .background(.bar)
                .cornerRadius(10)
                .padding()
            }
            .frame(maxWidth: 300, maxHeight: 200)
        }
        .buttonStyle(.plain)
    }
}

struct PlaceCard_Previews: PreviewProvider {
    static var previews: some View {
        PlaceCard(place: Place(name: "", country: "", rate: 4.5, description: ""))
    }
}
