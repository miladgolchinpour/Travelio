//
//  AccountViewModel.swift
//  Travel
//
//  Created by Milad Golchinpour on 7/13/21.
//

import FirebaseAuth
import FirebaseStorage
import FirebaseFirestore
import SwiftUI

/// Auth and account methods
class AccountViewModel: ObservableObject {
    
    // Account system managed with Firebase
    // USING GOOGLE UTITLITIES
    
    private let db = Firestore.firestore().collection("users")
    private let st = Storage.storage()
    
    // MARK: Login to account
    func login(_ email: String, password: String, completion: @escaping (_ success: Bool) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { result, err in
            if let _ = result?.user {
                completion(true)
            } else {
                completion(false)
            }
        }
    }
    
    // MARK: Create a new account
    func createAccount(_ email: String, password: String, completion: @escaping (_ success: Bool) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { result, err in
            if let user = result?.user {
                self.db.document(user.uid).setData([
                    "id": user.uid,
                    "name": user.displayName ?? "User",
                    "photo": user.photoURL?.description ?? URL(string: "https://firebasestorage.googleapis.com/v0/b/travelsample-94b99.appspot.com/o/images%2Fde6589f0-2359-11eb-ae21-758444039e75.jpg.png?alt=media&token=27ceabbe-75cf-475b-b251-186b4bfec280")!.description,
                    "email": user.email!
                ])
                completion(true)
            } else {
                completion(false)
            }
        }
    }
    
    // MARK: Set or change account display name
    func setAccountName(user: User, name: String) {
        self.db.document(user.uid).updateData([
            "name": name
        ])
    }
    
    // MARK: Fetch display account name
    func getAccountName(user: User, name: @escaping (String) -> Void) {
        self.db.document(user.uid).addSnapshotListener { querySnap, err in
            if let err = err { print(err.localizedDescription) } else {
                let data = querySnap?.data()
                if let data = data {
                    let accountName = data["name"] as? String ?? "User"
                    name(accountName)
                }
            }
        }
    }
    
    // MARK: Sign out from account
    func signOut() {
        do {
            try Auth.auth().signOut()
            AppSettings().haveAccount = false
            AppSettings().isShowingWelcome = true
            print("Success")
        } catch {
            print("Error when signing out")
        }
    }
    
    // MARK: Get the current user info
    func currentUser() -> User? {
        Auth.auth().currentUser
    }
    
    // MARK: Send forget password email
    func forgetPassword(_ email: String, completion: @escaping (_ success: Bool) -> Void) {
        Auth.auth().sendPasswordReset(withEmail: email) { err in
            if let err = err {
                print(err.localizedDescription)
                completion(false)
            }
            completion(true)
        }
    }
    
    // MARK: Update account profile photo
    func uploadProfilePic(user: User, image: UIImage, completion: @escaping (_ success: Bool) -> Void) {
        let data = (image.jpegData(compressionQuality: 0.2))!
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpg"
        st.reference().child("profiles/\(user.uid).jpg").putData(data, metadata: metadata) { metaData, err in
            if let err = err {
                print(err.localizedDescription)
                completion(false)
            } else {
                self.getImageURLFromStorage(user: user) { url in
                    self.db.document(user.uid).updateData([
                        "photo": url.description
                    ]) { err in
                        if let err = err {
                            print(err.localizedDescription)
                            completion(false)
                        } else {
                            completion(true)
                        }
                    }
                }
            }
        }
    }
    
    // MARK: Fetch the image url of uploaded photo to Firebase Storage
    func getImageURLFromStorage(user: User, urlOutput: @escaping (URL) -> Void) {
        st.reference().child("profiles/\(user.uid).jpg").downloadURL { url, err in
            if let err = err {
                print(err.localizedDescription)
            }
            if let url = url {
                urlOutput(url)
            }
        }
    }
    
    // MARK: Get the profile photo string url from database
    func getProfilePicURL(user: User, imageURL: @escaping (String) -> Void) {
        db.document(user.uid).addSnapshotListener { querySnap, err in
            if let err = err { print(err.localizedDescription) }
            let data = querySnap?.data()
            if let data = data {
                let url = data["photo"] as? String ?? ""
                imageURL(url)
            }
        }
    }
}
