//
//  ChangeLoginMode.swift
//  Travel
//
//  Created by Milad Golchinpour on 7/14/21.
//

import SwiftUI

struct ChangeLoginMode: View {
    @Binding var isSignIn: Bool
    @Binding var password: String
    @Binding var showViews: Bool
    
    var body: some View {
        Button(isSignIn ? "Don't have an account?" : "Already have an account?") {
            password = ""
            withAnimation(.easeInOut(duration: 0.6)) {
                showViews = false
                isSignIn.toggle()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                    showViews = true
                }
            }
        }
        .foregroundColor(.white)
    }
}

struct ChangeLoginMode_Previews: PreviewProvider {
    static var previews: some View {
        ChangeLoginMode(isSignIn: .constant(false), password: .constant(""), showViews: .constant(true))
    }
}
