//
//  PlaceReviewView.swift
//  Travel
//
//  Created by Milad Golchinpour on 7/16/21.
//

import SwiftUI

/// PlaceReview included all reviews already added by every user in selected place
struct PlaceReviewView: View {
    var place: Place
    
    @ObservedObject var accountViewModel = AccountViewModel()
    @ObservedObject var network = NetworkMonitor()
    
    @StateObject var reviewsViewModel = ReviewsViewModel()
    
    @State var reviews: [Review]? = nil
    @State var imageURL = ""
    @State var accountName = ""
    @State private var showAddReviewSheet = false
    
    var body: some View {
        if !network.isConnected {
            HStack { Image(systemName: "wifi.slash"); Text("No Connection") }
        } else {
            if let user = accountViewModel.currentUser() {
                VStack {
                    if let reviews = reviews {
                        Button { showAddReviewSheet.toggle() } label: {
                            Text("New Review")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(.blue)
                                .cornerRadius(15)
                                .padding()
                        }
                        
                        if reviews.isEmpty {
                            Text("No reviews")
                        } else {
                            ForEach(reviews.sorted{ $0.date.timeIntervalSinceNow > $1.date.timeIntervalSinceNow }, id: \.comment) { review in
                                ZStack(alignment: .topTrailing) {
                                    if reviewsViewModel.userReviews.contains { $0 == review } {
                                        Button(role: .destructive) {
                                            withAnimation {
                                                reviewsViewModel.deleteReview(place: place, review: review)
                                            }
                                        } label: {
                                            Image(systemName: "trash")
                                                .padding([.top, .trailing])
                                        }
                                    }
                                    
                                    VStack {
                                        ReviewShapeView(review: review)
                                        Divider()
                                    }
                                }
                            }
                        }
                    } else {
                        ProgressView()
                    }
                }
                .padding(.bottom, 100)
                .sheet(isPresented: $showAddReviewSheet) {
                    AddReviewView(by: accountName, photoURL: imageURL, place: place, viewModel: reviewsViewModel)
                }
                .onAppear {
                    reviewsViewModel.fetchAllReviews(place: place) { reviews in
                        self.reviews = reviews
                    }
                    
                    accountViewModel.getProfilePicURL(user: user) { url in
                        self.imageURL = url
                    }
                    
                    accountViewModel.getAccountName(user: user) { name in
                        accountName = name
                    }
                }
            }
        }
    }
}

struct PlaceReviewView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceReviewView(place: PlacesViewModel().recommended[0])
    }
}

extension Review: Equatable {
    static func == (lhs: Review, rhs: Review) -> Bool {
        return lhs.comment == rhs.comment
    }
}
