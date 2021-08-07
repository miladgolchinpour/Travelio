//
//  PlaceOverviewView.swift
//  Travel
//
//  Created by Milad Golchinpour on 7/16/21.
//

import SwiftUI

/// PlaceOverview included place description
struct PlaceOverviewView: View {
    var place: Place
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Description")
                .font(.headline)
                .padding(.bottom, 10)
            
            Text(place.description)
                .opacity(0.9)
                .padding(.bottom)
                .lineSpacing(5)
        }
        .padding()
    }
}

struct PlaceOverviewView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceOverviewView(place: PlacesViewModel().recommended[0])
    }
}
