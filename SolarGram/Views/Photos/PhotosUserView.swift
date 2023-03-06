//
//  PhotosUserView.swift
//  SolarGram
//
//  Created by Alan Brantley on 3/3/23.
//

import SwiftUI

// A view that displays a user's profile image and name for a photo post
struct PhotosUserView: View {
    
    // The photo post to display user information for
    var post: Post
    
    var body: some View {
        HStack {
            // Display the user's profile image in a circle with dimensions 30x30
            Image("\(post.profileImageName)")
                .resizable()
                .frame(width: 30, height: 30)
                .clipShape(Circle())
            // Display the user's name in a headline font
            Text(post.userName)
                .font(.headline)
            // Add a spacer to push the user information to the left and the post information to the right
            Spacer()
        }
    }
}

struct PhotosUserView_Previews: PreviewProvider {
    static var previews: some View {
        let test = Post(id: 01, name: "biodome", userName: "Alan Brantley", profileImageName: "01_AlanBrantley")
        PhotosUserView(post: test)
    }
}
