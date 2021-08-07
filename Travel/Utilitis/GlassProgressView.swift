//
//  GlassProgressView.swift
//  Travel
//
//  Created by Milad Golchinpour on 7/15/21.
//

import SwiftUI

struct GlassProgressView: View {
    @State private var show = true
    
    var body: some View {
        if show {
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .frame(maxWidth: 270, maxHeight: 230)
                        .foregroundStyle(.ultraThinMaterial)
                        .padding()
                    
                    ProgressView()
                        .frame(width: 100, height: 100)
                }
                .transition(.opacity)
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    withAnimation {
                        show = false
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

struct GlassProgressView_Previews: PreviewProvider {
    static var previews: some View {
        GlassProgressView()
    }
}
