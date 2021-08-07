//
//  ProfileView.swift
//  Travel
//
//  Created by Milad Golchinpour on 7/15/21.
//

import SwiftUI

/// Profile info view of current user
struct ProfileView: View {
    @ObservedObject var accountViewModel = AccountViewModel()
    @ObservedObject var network = NetworkMonitor()
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var imageURL = "https://firebasestorage.googleapis.com/v0/b/travelsample-94b99.appspot.com/o/images%2Fde6589f0-2359-11eb-ae21-758444039e75.jpg.png?alt=media&token=27ceabbe-75cf-475b-b251-186b4bfec280"
    
    @State private var image: UIImage? = nil
    @State private var showImagePicker = false
    @State private var showSuccesImageUploadedAlert = false
    @State private var showFailureImageUploadedAlert = false
    @State private var showProgressView = false
    @State private var showChangeNameField = false
    @State private var showSignOutAlert = false
    
    @State private var accountName = ""
    
    var body: some View {
        if let user = accountViewModel.currentUser() {
            ZStack {
                ZStack(alignment: .topLeading) {
                    VStack {
                        ScrollView(showsIndicators: false) {
                            VStack {
                                Text("Profile Photo")
                                    .boldTitleStyle()
                                
                                HStack {
                                    if network.isConnected {
                                        AsyncImage(url: URL(string: imageURL)!) { imageProfile in
                                            imageProfile
                                                .resizable()
                                                .frame(maxWidth: 100, maxHeight: 100)
                                                .clipShape(Circle())
                                        } placeholder: {
                                            Circle()
                                                .frame(maxWidth: 100, maxHeight: 100)
                                                .overlay(ProgressView())
                                        }
                                    } else {
                                        Text("No Connection")
                                            .foregroundColor(.red)
                                    }
                                    
                                    Spacer()
                                    
                                    Button { showImagePicker.toggle() } label: {
                                        Text("Update")
                                            .padding()
                                            .foregroundColor(.white)
                                            .background(.blue)
                                            .cornerRadius(15)
                                    }
                                    .disabled(!network.isConnected)
                                    .opacity(!network.isConnected ? 0.6 : 1)
                                }
                                .padding()
                                .background(.bar)
                                .cornerRadius(15)
                                
                                Text("Information")
                                    .boldTitleStyle()
                                
                                VStack(alignment: .leading) {
                                    Text("Email: \(user.email!)")
                                    
                                    HStack {
                                        Text("Display name: \(accountName)")
                                        Spacer()
                                        Button("Change") {
                                            withAnimation {
                                                showChangeNameField.toggle()
                                            }
                                        }
                                        .foregroundColor(.orange)
                                        .disabled(!network.isConnected)
                                        .opacity(!network.isConnected ? 0.6 : 1)
                                    }
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                                .background(.bar)
                                .cornerRadius(15)
                                
                                HStack {
                                    Button("Sign out") { showSignOutAlert.toggle() }
                                    .tint(.red)
                                    .disabled(!network.isConnected)
                                    
                                    NavigationLink { CreditView() } label: {
                                        Text("Credits")
                                    }
                                    .tint(.indigo)
                                }
                                .padding()
                                .buttonStyle(.borderedProminent)
                                
                                Text("Version \(((Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String)!))(\((Bundle.main.infoDictionary?["CFBundleVersion"] as? String)!))")
                                    .foregroundColor(.white)
                                    .opacity(0.8)
                                    .font(.footnote)
                            }
                            .padding(.top, 75)
                            .frame(maxWidth: 600)
                            .padding()
                            .padding(.horizontal)
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Image("BackgroundL").resizable().scaledToFill())
                    .ignoresSafeArea()
                    
                    IceBackButton()
                        .padding([.top, .leading])
                }
                
                if showSuccesImageUploadedAlert {
                    GlassAlert(title: "Updated", success: true)
                }
                
                if showFailureImageUploadedAlert {
                    GlassAlert(title: "Error", success: false)
                }
                
                if showProgressView {
                    GlassProgressView()
                }
                
                if showChangeNameField {
                    FieldAlert(editText: $accountName, placeholder: "New name...") {
                        accountViewModel.setAccountName(user: user, name: accountName)
                    }
                }
            }
            .navigationBarHidden(true)
            .task {
                accountViewModel.getProfilePicURL(user: user) { url in
                    self.imageURL = url
                }
                
                accountViewModel.getAccountName(user: user) { name in
                    accountName = name
                }
            }
            .sheet(isPresented: $showImagePicker, onDismiss: {
                if let image = image {
                    showProgressView = true
                    accountViewModel.uploadProfilePic(user: user, image: image) { success in
                        if success {
                            showSuccesImageUploadedAlert = true
                            showProgressView = false
                        } else {
                            showFailureImageUploadedAlert = true
                            showProgressView = false
                        }
                    }
                }
            }) {
                ImagePicker(image: $image)
                    .interactiveDismissDisabled(true)
            }
            .alert(isPresented: $showSignOutAlert) {
                Alert(
                    title: Text("Are you sure?"), message: Text("When signing out app will be restarted."), primaryButton: .cancel(), secondaryButton: .destructive(Text("Sign out"), action: {
                    withAnimation {
                        accountViewModel.signOut()
                        presentationMode.wrappedValue.dismiss()
                        fatalError("Signed out")
                    }
                })
                )
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
