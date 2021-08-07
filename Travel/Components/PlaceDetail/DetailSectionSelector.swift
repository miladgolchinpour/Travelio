//
//  DetailSectionSelector.swift
//  Travel
//
//  Created by Milad Golchinpour on 7/15/21.
//

import SwiftUI

enum DetailSelection: String, CaseIterable {
    case description = "Overview"
    case reviews = "Reviews"
    case photos = "Gallery"
}

/// Detail section picker and changing it
struct DetailSectionSelector: View {
    @Binding var selection: DetailSelection
    
    var body: some View {
        HStack(spacing: 20) {
            ForEach(DetailSelection.allCases, id: \.self) { section in
                Button {
                    selection = section
                } label: {
                    Text(section.rawValue)
                        .foregroundColor(.primary.opacity(0.7))
                        .font(.headline)
                        .opacity(selection == section ? 1 : 0.6)
                }
            }
        }
    }
}

struct DetailSectionSelector_Previews: PreviewProvider {
    static var previews: some View {
        DetailSectionSelector(selection: .constant(.description))
    }
}
