//
//  ProfileUserView.swift
//  SolarGram
//
//  Created by Alan Brantley on 3/3/23.
//

import SwiftUI

// A view that displays a user's profile image and name for the ProfileView
struct ProfileUserView: View {
    
    // variable to Model
    var post: Post
    
    // View model for the PostView
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            // Profile Image
            ImageView(aspect: 1.0, post: post, imageType: "userPhotoID")
                .clipShape(Circle())
                .frame(width: 60, height: 60)
            
            // User Name
            Text(post.author)
                .font(.title)
                
            }
        }
    }

struct ProfileUserView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileUserView(post:  Post(photoID: UIImage(named: "photo1"), description: "Biodome", author: "Alan", userPhotoID:  "alan"))
    }
}
