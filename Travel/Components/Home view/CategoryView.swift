//
//  CategoryView.swift
//  Travel
//
//  Created by Milad Golchinpour on 7/14/21.
//

import SwiftUI

struct CategoryView: View {
    @EnvironmentObject var appSettings: AppSettings
    
    var category: Category
    
    var body: some View {
        Button {
            withAnimation {
                appSettings.selectedCategory = category
                appSettings.selectedCategory = category
            }
        } label: {
            HStack {
                Image(systemName: category.icon)
                    .foregroundColor(.white)
                    .font(.title3)
                
                Text(category.name)
                    .foregroundColor(.white)
            }
            .padding()
            .background(Color(category.color))
            .cornerRadius(15)
        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(category: Category(name: "Nature", icon: "nature", color: "pink", items: []))
            .environmentObject(AppSettings())
    }
}
