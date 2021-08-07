//
//  NameField.swift
//  Travel
//
//  Created by Milad Golchinpour on 7/13/21.
//

import SwiftUI

struct NameField: View {
    @EnvironmentObject var appSettings: AppSettings
    
    @Binding var name: String
    
    @ObservedObject var accountViewModel: AccountViewModel
    
    var isCorrectName: Bool { !name.isEmpty || !(name.count >= 15) }
    
    var body: some View {
        VStack(spacing: 50) {
            Text("What's your name?")
                .foregroundColor(.white)
                .font(.system(size: 25, weight: .semibold, design: .rounded))
            
            TextField("Name", text: $name)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .glassStyle()
            
            if let user = accountViewModel.currentUser() {
                Button("Submit") {
                    accountViewModel.setAccountName(user: user, name: name)
                    appSettings.haveAccount = true
                    appSettings.isShowingWelcome = false
                }
                .buttonStyle(.borderedProminent)
                .foregroundColor(.white)
                .controlSize(.large)
                .tint(.blue)
                .disabled(!isCorrectName)
                .opacity(isCorrectName ? 1 : 0.5)
            }
        }
    }
}

struct NameField_Previews: PreviewProvider {
    static var previews: some View {
        NameField(name: .constant("Milad"), accountViewModel: AccountViewModel())
    }
}
