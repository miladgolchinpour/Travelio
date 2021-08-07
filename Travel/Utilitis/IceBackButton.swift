//
//  IceBackButton.swift
//  Travel
//
//  Created by Milad Golchinpour on 7/15/21.
//

import SwiftUI

// "Ice" is a custom name for this view

struct IceBackButton: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Button { presentationMode.wrappedValue.dismiss() } label: {
            Image(systemName: "chevron.left")
                .font(.footnote)
                .foregroundColor(.white)
                .padding()
                .background(.black.opacity(0.7))
                .clipShape(Circle())
        }
        .buttonStyle(.plain)
        
    }
}

struct IceBackButton_Previews: PreviewProvider {
    static var previews: some View {
        IceBackButton()
    }
}
