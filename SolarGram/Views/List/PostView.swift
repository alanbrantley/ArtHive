//
//  PostView.swift
//  SolarGram
//
//  Created by Alan Brantley on 3/3/23.
//

import SwiftUI

// Check if the current platform is macOS
#if os(macOS)
    // Import the AppKit framework
    import AppKit
#else
#endif


// A view that displays all the elements of a single user post
struct PostView: View {
    
    // The post to display
    var post: Post
    
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
       
        VStack(alignment: .leading) {
            
            // Show the user's photos
            UserView(post: post)
                .padding(.leading, 8)
                .padding(.top, 5)
            
            // Show the image for the post (use either "name" or "profileImageName")
            ImageView(post: post, imageType: "photoID")
            
            // Show the post description
            Text(post.description)
                .font(.footnote)
                .padding(.leading, 8)
                .padding(.bottom, 10)
            
            // Show a love button that toggles the isLoved state variable
            FavoriteButton(post: post)
                .padding(.leading, 8)
                .padding(.bottom, 5)
            
            #if os(macOS)
                Spacer()
                Divider()
            #else
                
            #endif
            
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(post: Post(photoID: "photo1", description: "Biodome", author: "Alan", userPhotoID:  "alan"))
            .environmentObject(ViewModel())
    }
}
