//
//  LoginButton.swift
//  Travel
//
//  Created by Milad Golchinpour on 7/13/21.
//

import SwiftUI

struct LoginButton: View {
    @EnvironmentObject var appSettings: AppSettings
    
    @ObservedObject var viewModel: AccountViewModel
    
    @Binding var isSignIn: Bool
    @Binding var nameField: Bool
    
    var email: String
    var password: String
    
    var isCorrectEmail: Bool { !email.isEmpty || !password.isEmpty || email.contains("@") }
    
    var body: some View {
        Button {
            if isSignIn {
                viewModel.login(email, password: password) { success in
                    if success {
                        print("Logined")
                        withAnimation(.easeInOut(duration: 0.6)) {
                            appSettings.successLogin = true
                        }
                    } else {
                        print("Not similar account founded")
                        appSettings.successLogin = false
                    }
                }
            } else {
                viewModel.createAccount(email, password: password) { success in
                    if success {
                        print("Account successfully created")
                        withAnimation(.easeInOut(duration: 0.6)) {
                            appSettings.successLogin = true
                            nameField.toggle()
                        }
                    } else {
                        print("Error when creating account")
                        appSettings.successLogin = false
                    }
                }
            }
        } label: {
            Text(isSignIn ? "Sign in" : "Create account")
                .foregroundColor(.white)
                .font(.headline)
                .padding()
                .frame(maxWidth: 300, maxHeight: 55)
                .background(.blue.opacity(0.7))
                .cornerRadius(15)
                .padding(.top)
        }
        .disabled(!isCorrectEmail)
        .opacity(isCorrectEmail ? 1 : 0.5)
    }
}

struct LoginButton_Previews: PreviewProvider {
    static var previews: some View {
        LoginButton(
            viewModel: AccountViewModel(),
            isSignIn: .constant(true),
            nameField: .constant(false),
            email: "example@example.com",
            password: "12345678"
        )
    }
}
