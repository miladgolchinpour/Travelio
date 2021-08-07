//
//  ReviewsViewModel.swift
//  Travel
//
//  Created by Milad Golchinpour on 7/16/21.
//

import SwiftUI
import FirebaseFirestore

/// Manage reviews for places
class ReviewsViewModel: ObservableObject {
    // MARK: Current user all reviews have been created
    @Published var userReviews: [Review] {
        didSet {
            if let data = try? JSONEncoder().encode(userReviews) {
                UserDefaults.standard.set(data, forKey: "userReviews")
            }
        }
    }
    
    // MARK: Fetch user reviews from app storage and set it to variable
    init() {
        if let data = UserDefaults.standard.data(forKey: "userReviews") {
            do {
                let decoded = try JSONDecoder().decode([Review].self, from: data)
                self.userReviews = decoded
                return
            } catch {
                print("error: couldn't get data from user defaults")
            }
        }
        
        self.userReviews = []
    }
    
    // MARK: Firestore database instance
    private let db = Firestore.firestore()
    
    // MARK: Add new review to database
    func addNewReview(review: Review, place: Place, completion: @escaping (_ success: Bool) -> Void) {
        db.collection(place.id!).document(review.comment).setData([
            "username": review.username,
            "userPhotoURL": review.userPhotoURL,
            "rate": review.rate,
            "comment": review.comment,
            "date": Timestamp(date: review.date)
        ]) { err in
            if let err = err {
                print("error")
                print(err.localizedDescription)
                completion(false)
            } else {
                print("success")
                self.userReviews.append(review)
                completion(true)
            }
        }
    }
    
    // MARK: Delete review item from database
    func deleteReview(place: Place, review: Review) {
        db.collection(place.id!).document(review.comment).delete { err in
            if let err = err {
                print("err: \(err.localizedDescription)")
            } else {
                self.userReviews.removeAll { $0.comment == review.comment }
                print("deleted")
            }
        }
    }
    
    // MARK: Fetch all reviews already added to database
    func fetchAllReviews(place: Place, reviews: @escaping ([Review]?) -> Void) {
        db.collection(place.id!).addSnapshotListener { querySnap, err in
            if let err = err {
                print("error")
                print(err.localizedDescription)
            } else {
                guard let docs = querySnap?.documents else {
                    print("no docs")
                    return
                }
                
                let reviewsData = docs.map { queryDocSnap -> Review in
                    let data = queryDocSnap.data()
                    
                    let username = data["username"] as? String ?? "Unknown"
                    let userPhotoURL = data["userPhotoURL"] as? String ?? ""
                    let rate = data["rate"] as? Double ?? 4.5
                    let comment = data["comment"] as? String ?? "Empty"
                    let date = data["date"] as? Timestamp
                    
                    return Review(username: username, userPhotoURL: userPhotoURL, rate: rate, comment: comment, date: (date?.dateValue()) ?? Date())
                }
                
                reviews(reviewsData)
            }
        }
    }
}
