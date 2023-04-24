//
//  PhotosUserView.swift
//  SolarGram
//
//  Created by Alan Brantley on 3/3/23.
//

import SwiftUI

// A view that displays a user's profile image and name for a photo post
struct UserView: View {
    
    // The photo post to display user information for
    var post: Post
    
    // The ViewModel that holds the solarGramPosts array
    @EnvironmentObject var viewModel: ViewModel
    
    // The name of the image file to be displayed, constructed from the post's id and name
    var imageName: String {
        "\(post.userPhotoID)"
    }
    
    var body: some View {
        HStack {
            // Display the user's profile image in a circle with dimensions 30x30
            ImageView(post: post, imageType: "userPhotoID")
                .clipShape(Circle())
                .frame(width: 32, height: 32)
            
            // Display the user's name in a headline font
            Text(post.author)
                .font(.headline)
            
            // Add a spacer to push the user information to the left and the post information to the right
            Spacer()
        }
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        let test = Post(photoID: UIImage(named: "photo1"), description: "Biodome", author: "Alan", userPhotoID:  "alan", comments: [])
        // Preview the UserView with a test post
        UserView(post: test)
            .environmentObject(ViewModel())
    }
}
