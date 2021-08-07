//
//  AddReviewView.swift
//  Travel
//
//  Created by Milad Golchinpour on 7/16/21.
//

import SwiftUI
import StarRating

/// Add new review with custom rating
struct AddReviewView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var by: String
    var photoURL: String
    var place: Place
    
    @ObservedObject var viewModel: ReviewsViewModel
    
    @State var reviewText = ""
    @State var rating = 5.0
    @State var showSuccessAlert = false
    @State var showFailureAlert = false
    
    var body: some View {
        NavigationView {
            Form {
                Section("review") {
                    TextEditor(text: $reviewText.animation())
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .frame(minHeight: 100)
                }
                
                Section("rating") {
                    StarRating(initialRating: 4.5) { newValue in
                        self.rating = newValue
                    }
                    .frame(minHeight: 30)
                    .padding(.trailing, 50)
                    .padding(.vertical, 10)
                }
                
                Section {
                    if reviewText.count < 15 {
                        Text("Need more \(15 - reviewText.count) characters")
                            .foregroundColor(.red)
                    }
                    Button("Done") {
                        addReview()
                        print("ok")
                    }
                    .disabled(reviewText.count < 15)
                    
                }
                .alert(isPresented: $showFailureAlert) { failureAlert }
            }
            .navigationTitle("New Review")
            .alert(isPresented: $showSuccessAlert) { successAlert }
            .toolbar {
                Button("Cancel") { presentationMode.wrappedValue.dismiss() }
            }
        }
    }
    
    func addReview() {
        let review = Review(username: by, userPhotoURL: photoURL, rate: rating, comment: reviewText, date: Date())
        viewModel.addNewReview(review: review, place: place) { success in
            if success { showSuccessAlert = true } else {
                showFailureAlert = true
            }
        }
    }

    var successAlert: Alert {
        Alert(
            title: Text("Added!"),
            message: Text("Your review successfuly added"),
            dismissButton: .cancel(Text("Done")) { presentationMode.wrappedValue.dismiss() }
        )
    }

    var failureAlert: Alert {
        Alert(
            title: Text("Error!"),
            message: Text("Error when adding your review"),
            primaryButton: .cancel(Text("Done")) { presentationMode.wrappedValue.dismiss() },
            secondaryButton: .default(Text("Try agin")) { addReview() }
        )
    }
}

struct AddReviewView_Previews: PreviewProvider {
    static var previews: some View {
        AddReviewView(by: "Milad", photoURL: "", place: PlacesViewModel().recommended[0], viewModel: ReviewsViewModel())
    }
}
