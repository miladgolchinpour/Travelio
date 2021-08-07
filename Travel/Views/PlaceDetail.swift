//
//  PlaceDetail.swift
//  Travel
//
//  Created by Milad Golchinpour on 7/14/21.
//

import SwiftUI

/// Showing detail of tapped view included top card, overview, reviews and image gallery
struct PlaceDetail: View {
    var place: Place
    
    @Environment(\.horizontalSizeClass) var hSizeClass
    
    @State var selectedSection: DetailSelection = .description
    @State var showFullImage: Bool = true
    
    var body: some View {
        VStack {
            // top section of view, place image, info, back button
            ZStack(alignment: .topLeading) {
                // place image and info
                ZStack(alignment: .bottomLeading) {
                    Image(place.name)
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(30, corners: [.bottomLeft, .bottomRight])
                    
                    if showFullImage {
                        PlaceInfoCard(place: place)
                            .padding()
                    }
                }
                
                // back button
                IceBackButton()
                    .padding([.top, .leading])
                    .padding(.top)
            }
            
            // detail section selector
            DetailSectionSelector(selection: $selectedSection)
            
            TrackableScrollView { offset in
                if hSizeClass == .compact {
                    withAnimation(.spring()) {
                        if offset.y <= -150 { showFullImage = false } else {
                            showFullImage = true
                        }
                    }
                }
            } content: {
                switch selectedSection {
                case .description:
                    PlaceOverviewView(place: place)
                case .reviews:
                    PlaceReviewView(place: place)
                case .photos:
                    PlaceGalleryView(place: place)
                }
            }
            
        }
        .navigationBarHidden(true)
        .statusBar(hidden: true)
        .ignoresSafeArea()
        .frame(maxWidth: 712)
        .background(.background)
        .frame(maxWidth: .infinity)
        .background(.ultraThinMaterial)
        .background(Color.blue.opacity(0.6))
    }
}

struct PlaceDetail_Previews: PreviewProvider {
    static var previews: some View {
        PlaceDetail(place: PlacesViewModel().recommended[0])
    }
}
