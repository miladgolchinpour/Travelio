//
//  FeaturesView.swift
//  Travel
//
//  Created by Milad Golchinpour on 7/13/21.
//

import SwiftUI

/// Show all features of the app
struct FeaturesView: View {
    var body: some View {
        ZStack {
            VStack(spacing: 15.0) {
                FeatureRow(
                    icon: "globe.asia.australia.fill",
                    title: "Easy",
                    subtitle: "Fantastic and best cities you should travel to there",
                    iconColor: .mint
                )
                
                FeatureRow(
                    icon: "sun.min.fill",
                    title: "Weather",
                    subtitle: "For check weather to when traveling",
                    iconColor: .orange
                )
                
                FeatureRow(
                    icon: "heart.text.square.fill",
                    title: "Save it",
                    subtitle: "Save a place to saved list for travel later",
                    iconColor: .pink
                )
                
                NavigationLink(destination: LoginView()) {
                    Text("Get started")
                }
                .buttonStyle(.bordered)
            }
            .frame(maxWidth: 712, maxHeight: 500)
            .background(.thinMaterial)
            .cornerRadius(50)
        }
    }
}

struct FeaturesView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturesView()
    }
}
