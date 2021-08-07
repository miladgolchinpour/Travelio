//
//  Extensions.swift
//  Travel
//
//  Created by Milad Golchinpour on 7/13/21.
//

import SwiftUI

// MARK: - glassTextStyle for login view
extension View {
    func glassStyle() -> some View {
        self.padding()
            .frame(maxWidth: 280, maxHeight: 60)
            .background(.thinMaterial)
            .cornerRadius(15)
    }
}

// MARK: - bold style text for category and category title
extension Text {
    func boldTitleStyle() -> some View {
        self.foregroundColor(.white)
            .font(.title2)
            .bold()
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
    }
}

// MARK: - simple extension and shape for specefic corner radius
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
