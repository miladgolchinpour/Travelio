//
//  GlassAlert.swift
//  Travel
//
//  Created by Milad Golchinpour on 7/13/21.
//

import SwiftUI

struct GlassAlert: View {
    @EnvironmentObject var appSettings: AppSettings
    
    var title: String
    var success: Bool
    
    @State private var show = true
    
    var body: some View {
        if show {
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .frame(maxWidth: 270, maxHeight: 230)
                        .foregroundStyle(.ultraThinMaterial)
                        .padding()
                    
                    VStack(spacing: 40) {
                        Image(systemName: success ? "checkmark" : "xmark")
                            .font(.system(size: 60, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                        
                        Text(title)
                            .font(.title)
                            .bold()
                            .foregroundColor(.white)
                    }
                }
                .transition(.opacity)
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    withAnimation {
                        show = false
                        appSettings.successLogin = nil
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.black.opacity(0.6))
            .transition(.asymmetric(insertion: AnyTransition.opacity.animation(.easeInOut), removal: .scale))
            .ignoresSafeArea()
        }
    }
}

struct GlassAlert_Previews: PreviewProvider {
    static var previews: some View {
        GlassAlert(title: "Account created", success: true)
    }
}
