//
//  FieldAlert.swift
//  Travel
//
//  Created by Milad Golchinpour on 7/15/21.
//

import SwiftUI

/// Alert with a TextField!
struct FieldAlert: View {
    @Binding var editText: String
    var placeholder: String
    var action: () -> Void
    
    @State private var show = true
    
    var body: some View {
        if show {
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .frame(maxWidth: 270, maxHeight: 230)
                        .foregroundStyle(.ultraThinMaterial)
                        .padding()
                    
                    VStack(spacing: 30) {
                        TextField(placeholder, text: $editText)
                            .padding()
                            .frame(maxWidth: 200)
                            .textFieldStyle(.roundedBorder)
                            .disableAutocorrection(true)
                        
                        Button { action(); withAnimation { show.toggle()} } label: {
                            Text("Done")
                                .padding()
                                .foregroundColor(.white)
                                .background(.blue)
                                .cornerRadius(15)
                                .padding()
                        }
                        .disabled(editText.isEmpty || editText.count > 15)
                        .opacity(editText.isEmpty || editText.count > 15 ? 0.6 : 1)
                    }
                }
                .transition(.opacity)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.black.opacity(0.6))
            .transition(.asymmetric(insertion: AnyTransition.opacity.animation(.easeInOut), removal: .scale))
            .ignoresSafeArea()
        }
    }
}

struct FieldAlert_Previews: PreviewProvider {
    static var previews: some View {
        FieldAlert(editText: .constant("Title"), placeholder: "Name", action: {})
    }
}
