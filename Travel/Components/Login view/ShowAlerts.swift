//
//  ShowAlerts.swift
//  Travel
//
//  Created by Milad Golchinpour on 7/14/21.
//

import SwiftUI

struct ShowAlerts: View {
    @ObservedObject var appSettings: AppSettings
    @Binding var isSignIn: Bool
    
    var body: some View {
        if let successLogin = appSettings.successLogin {
            if isSignIn {
                if successLogin {
                    GlassAlert(title: "Successfully Login", success: true)
                        .animation(.easeInOut(duration: 1), value: successLogin)
                        .onDisappear {
                            appSettings.haveAccount = true
                            appSettings.isShowingWelcome = false
                        }
                } else {
                    GlassAlert(title: "Wrong Data", success: false)
                        .animation(.easeInOut(duration: 1), value: successLogin)
                }
            } else {
                if successLogin {
                    GlassAlert(title: "Account Created", success: true)
                        .animation(.easeInOut(duration: 1), value: successLogin)
                } else {
                    GlassAlert(title: "Already Created", success: false)
                        .animation(.easeInOut(duration: 1), value: successLogin)
                }
            }
        }
    }
}

struct ShowAlerts_Previews: PreviewProvider {
    static var previews: some View {
        ShowAlerts(appSettings: AppSettings(), isSignIn: .constant(true))
    }
}
