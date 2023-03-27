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
    
    @EnvironmentObject var viewModel: ViewModel
    
    // The name of the image file to be displayed, constructed from the post's id and name
    var imageName: String {
        "\(post.profileImageName)"
    }
    
    var body: some View {
        HStack {
            // Display the user's profile image in a circle with dimensions 30x30
            ImageView(post: post, imageType: "profileImageName")
                .clipShape(Circle())
                .frame(width: 32, height: 32)
            
            // Display the user's name in a headline font
            Text(post.userName)
                .font(.headline)
            
            // Add a spacer to push the user information to the left and the post information to the right
            Spacer()
        }
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        let test = Post(id: 01, name: "biodome", userName: "Alan Brantley", profileImageName: "01_AlanBrantley", image: nil)
        UserView(post: test)
            .environmentObject(ViewModel())
    }
}
