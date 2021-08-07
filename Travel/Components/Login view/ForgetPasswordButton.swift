//
//  ForgetPasswordButton.swift
//  Travel
//
//  Created by Milad Golchinpour on 7/14/21.
//

import SwiftUI

struct ForgetPasswordButton: View {
    @ObservedObject var accountViewModel: AccountViewModel
    
    @State private var emailText = ""
    @Binding var show: Bool
    
    var body: some View {
        VStack(spacing: 40) {
            VStack(alignment: .leading, spacing: 10) {
                Text("Enter your email")
                
                TextField("Email", text: $emailText)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .glassStyle()
            }
            
            Button{
                accountViewModel.forgetPassword(emailText) { success in
                    if success {
                        print("Success")
                    } else {
                        print("Error")
                    }
                }
            } label: {
                Text("Send link")
                    .foregroundColor(.white)
                    .padding()
                    .background(.blue)
                    .cornerRadius(15)
            }
            
            Button("Back to login") {
                withAnimation {
                    show.toggle()
                }
            }
            .buttonStyle(.plain)
            .colorScheme(.dark)
        }
    }
}

struct ForgetPasswordButton_Previews: PreviewProvider {
    static var previews: some View {
        ForgetPasswordButton(accountViewModel: AccountViewModel(), show: .constant(false))
    }
}
