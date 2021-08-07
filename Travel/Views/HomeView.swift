//
//  HomeView.swift
//  Travel
//
//  Created by Milad Golchinpour on 7/14/21.
//

import SwiftUI

/// Main View showed when user signed in to account
struct HomeView: View {
    @EnvironmentObject var appSettings: AppSettings
    @StateObject var placesViewModel = PlacesViewModel()
    @ObservedObject var accountViewModel = AccountViewModel()
    @ObservedObject var network = NetworkMonitor()
    
    @State private var accountName = ""
    
    var body: some View {
        VStack(spacing: 0) {
            VStack {
                NavigationLink(destination: ProfileView()) {
                    Image(systemName: "person")
                        .foregroundStyle(.linearGradient(colors: [.blue, .indigo, .pink], startPoint: .topTrailing, endPoint: .bottomLeading))
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding(.trailing)
                        .padding(.top, 50)
                }
                
                Text("Hey \(accountName), Good \(generateTime())\nLet's discovering")
                    .foregroundColor(.white)
                    .font(.system(size: 25, weight: .semibold, design: .rounded))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.bottom, .leading])
            }
            .background(.ultraThinMaterial)
            
            ScrollView(showsIndicators: false) {
                if network.isConnected {
                    CategorySelector(viewModel: placesViewModel)
                    
                    CategoryPlaces(category: appSettings.selectedCategory)
                    
                    RecommendedView(viewModel: placesViewModel)
                        .padding(.bottom, 50)
                } else {
                    VStack(spacing: 20) {
                        Image(systemName: "wifi.slash")
                            .padding(.top)
                        Text("No Cennection")
                    }
                    .font(.largeTitle)
                    .foregroundColor(.white)
                }
            }
        }
        .background(Image("homeBg").resizable().scaledToFill())
        .ignoresSafeArea()
        .task {
            if let user = accountViewModel.currentUser() {
                accountViewModel.getAccountName(user: user) { name in
                    self.accountName = name
                }
            }
        }
    }
    
    func generateTime() -> String {
        let hour = Calendar.current.component(.hour, from: Date())
        
        switch hour {
        case 6..<12: return "Morning"
        case 12: return "Noon"
        case 13..<17: return "Afternoon"
        case 17..<22: return "Evening"
        default: return "Night"
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
