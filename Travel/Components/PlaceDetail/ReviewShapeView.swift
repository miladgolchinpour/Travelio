//
//  ReviewShapeView.swift
//  Travel
//
//  Created by Milad Golchinpour on 7/16/21.
//

import SwiftUI

/// Message like review shape
struct ReviewShapeView: View {
    var review: Review
    
    var personAnonymousImageURL = URL(string: "https://firebasestorage.googleapis.com/v0/b/travelsample-94b99.appspot.com/o/images%2Fde6589f0-2359-11eb-ae21-758444039e75.jpg.png?alt=media&token=27ceabbe-75cf-475b-b251-186b4bfec280")
    
    var dateFormatter: DateFormatter = {
       let df = DateFormatter()
        df.dateStyle = .medium
        df.timeStyle = .short
        return df
    }()
    
    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            AsyncImage(url: URL(string: review.userPhotoURL) ?? personAnonymousImageURL) { userImage in
                userImage
                    .resizable()
                    .frame(maxWidth: 45, maxHeight: 45)
                    .clipShape(Circle())
            } placeholder: {
                Circle()
                    .frame(width: 45, height: 45)
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text(review.username)
                    .font(.headline)
                
                Text(review.comment)
                    .opacity(0.8)
                
                Text(review.date, formatter: dateFormatter)
                    .font(.footnote)
                    .opacity(0.6)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct ReviewShapeView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewShapeView(
            review: Review(
                username: "Milad", userPhotoURL: "", rate: 0.0, comment: "good at all", date: Date()
            )
        )
    }
}
