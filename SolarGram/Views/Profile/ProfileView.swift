//
//  ProfileView.swift
//  SolarGram
//
//  Created by Alan Brantley on 3/3/23.
//

import SwiftUI

// A prfile view view that displays the user's picture, name, and posted images
struct ProfileView: View {
    
    // View model for the ProfileView
    @EnvironmentObject var viewModel: ViewModel
    
    // The post of the main user
    var post: Post
    
    // The number of columns for the LazyVGrid
    let numColumns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack {
            // The view that displays the main user's profile
            ProfileUserView(post: post)
            
            // The ScrollView that displays the main user's posted images
            ScrollView(.vertical) {
                LazyVGrid(columns: numColumns, spacing: 10) {
                    ForEach(viewModel.solarGramPosts.filter { $0.author == "Alan Brantley" }) { post in
                        // The ImageView that displays the posted image
                        ImageView(post: post, imageType: "name")
                            .clipped()
                    }
                }
                .padding(.horizontal, 0.0)
            }
            
            // Spacer to push the content to the top of the screen
            Spacer()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        let testPost = Post(photoID: "photo1", description: "Biodome", author: "Alan Brantley", userPhotoID: "alan")
        ProfileView(post: testPost)
            .environmentObject(ViewModel())
    }
}


