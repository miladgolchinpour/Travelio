//
//  LoginView.swift
//  Travel
//
//  Created by Milad Golchinpour on 7/13/21.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var appSettings: AppSettings
    
    @StateObject var accountViewModel = AccountViewModel()
    
    @State private var isShowingSignIn = true
    @State private var isShowingNameField = false
    @State private var isShowingViews = true
    @State private var isShowingForgetPassword = false
    
    @State private var nameText = ""
    @State private var emailText = ""
    @State private var passwordText = ""
    
    var body: some View {
        ZStack {
            Image("BackgroundL")
                .resizable()
                .ignoresSafeArea()
                .aspectRatio(contentMode: .fill)
            
            RoundedRectangle(cornerRadius: 40, style: .continuous)
                .frame(maxWidth: 712, maxHeight: 500)
                .foregroundStyle(.thinMaterial)
                .padding()
                .rotation3DEffect(.degrees(isShowingSignIn ? 0 : 180), axis: (x: 0, y: 360, z: 0))
            
            if isShowingNameField {
                NameField(name: $nameText, accountViewModel: accountViewModel)
            } else if isShowingForgetPassword {
                ForgetPasswordButton(accountViewModel: accountViewModel, show: $isShowingForgetPassword)
            } else {
                if isShowingViews {
                    VStack(alignment: .leading, spacing: 50) {
                        Text(isShowingSignIn ? "Sign in" : "Sign up")
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                        
                        VStack(spacing: 20) {
                            EmailPassField(email: $emailText, password: $passwordText)
                            
                            LoginButton(
                                viewModel: accountViewModel,
                                isSignIn: $isShowingSignIn,
                                nameField: $isShowingNameField,
                                email: emailText, password: passwordText
                            )
                            
                            ChangeLoginMode(
                                isSignIn: $isShowingSignIn,
                                password: $passwordText,
                                showViews: $isShowingViews
                            )
                            
                            if isShowingSignIn {
                                Button("Forget password?") {
                                    withAnimation {
                                        isShowingForgetPassword = true
                                    }
                                }.foregroundColor(.white)
                            }
                        }
                        .transition(.opacity)
                        .opacity(isShowingViews ? 1 : 0)
                        .animation(.easeIn, value: isShowingViews)
                    }
                    .transition(.opacity)
                    .opacity(isShowingViews ? 1 : 0)
                    .animation(.easeIn, value: isShowingViews)
                }
            }
            
            ShowAlerts(appSettings: appSettings, isSignIn: $isShowingSignIn)
        }
        .colorScheme(.dark)
        .navigationBarHidden(true)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
