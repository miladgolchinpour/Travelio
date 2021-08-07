//
//  StartDiscoveringButton.swift
//  Travel
//
//  Created by Milad Golchinpour on 7/13/21.
//

import SwiftUI

struct StartDiscoveringButton: View {
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Text("Start discovering")
                .foregroundColor(.indigo)
                .font(.headline)
                .padding()
                .padding(.vertical, 3)
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .cornerRadius(15)
        }
    }
}

struct StartDiscoveringButton_Previews: PreviewProvider {
    static var previews: some View {
        StartDiscoveringButton(action: {})
    }
}
