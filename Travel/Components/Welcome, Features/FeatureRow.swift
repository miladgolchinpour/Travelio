//
//  FeatureRow.swift
//  Travel
//
//  Created by Milad Golchinpour on 7/12/21.
//

import SwiftUI

struct FeatureRow: View {
    var icon: String
    var title: String
    var subtitle: String
    var iconColor: Color?
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: icon)
                .foregroundColor(iconColor ?? .indigo)
                .font(.system(size: 50, weight: .semibold, design: .rounded))
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(.title2)
                    .fontWeight(.semibold)
                    
                Text(subtitle)
                    .font(.body)
                    .opacity(0.7)
            }
            
            Spacer()
        }
        .padding()
        .padding(.horizontal)
    }
}

struct FeatureRow_Previews: PreviewProvider {
    static var previews: some View {
        FeatureRow(icon: "list.bullet", title: "Easy to use", subtitle: "Intro fantastic and best citeis you should travel to there")
    }
}
