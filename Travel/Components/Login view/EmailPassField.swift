//
//  EmailPassField.swift
//  Travel
//
//  Created by Milad Golchinpour on 7/13/21.
//

import SwiftUI

struct EmailPassField: View {
    @Binding var email: String
    @Binding var password: String
    
    @State private var showEmailError = false
    @State private var showPassword = false
    
    var body: some View {
        if showEmailError {
            HStack {
                Image(systemName: "exclamationmark.shield.fill")
                
                Text("Please enter correct email")
            }
            .foregroundColor(.red)
        }
        
        TextField("Email", text: $email)
            .font(.headline)
            .keyboardType(.emailAddress)
            .textContentType(.emailAddress)
            .submitLabel(.next)
            .glassStyle()
            .onSubmit {
                if !email.contains("@") {
                    showEmailError = true
                } else {
                    showEmailError = false
                }
            }
        
        ZStack(alignment: .trailing) {
            if showPassword {
                TextField("Password", text: $password)
                    .textContentType(.password)
                    .glassStyle()
            } else {
                SecureField("Password", text: $password)
                    .textContentType(.password)
                    .glassStyle()
            }
            
            Button {
                withAnimation {
                    showPassword.toggle()
                }
            } label: {
                Image(systemName: showPassword ? "eye.slash" : "eye")
                    .foregroundColor(.white)
                    .padding(.trailing)
                    .opacity(0.8)
            }
        }
        .autocapitalization(.none)
        .disableAutocorrection(true)
    }
}

struct EmailPassField_Previews: PreviewProvider {
    static var previews: some View {
        EmailPassField(email: .constant("example@example.com"), password: .constant("12345678"))
    }
}
