//
//  ProfileView.swift
//  SolarGram
//
//  Created by Alan Brantley on 3/3/23.
//

import SwiftUI

// A prfile view view that displays the user's picture, name, and posted images
struct ProfileView: View {
    
    // An array that holds the main user's posted images
    var images: [Post] = [
        Post(id: 1, name: "biodome", userName: "Alan Brantley", profileImageName: "01_AlanBrantley"),
        Post(id: 4, name: "citywalk", userName: "Alan Brantley", profileImageName: "01_AlanBrantley"),
        Post(id: 5, name: "tram", userName: "Alan Brantley", profileImageName: "01_AlanBrantley"),
        Post(id: 9, name: "treehouse", userName: "Alan Brantley", profileImageName: "01_AlanBrantley"),
        Post(id: 10, name: "mansion", userName: "Alan Brantley", profileImageName: "01_AlanBrantley")
    ]
    
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
                    ForEach(images, id: \.self) { post in
                        // The ImageView that displays the posted image
                        ImageView(post: post)
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
        let test = Post(id: 01, name: "biodome", userName: "Alan Brantley", profileImageName: "01_AlanBrantley")
        ProfileView(post: test)
    }
}
