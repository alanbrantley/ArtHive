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
    
    // View model for the PostView
    @EnvironmentObject var viewModel: ViewModel
//    @Binding var clickedOut: Bool
    
    var body: some View {
       
        VStack(alignment: .leading) {
            
            // Horizontal stack that contains the user's photo and a trash button for deleting
            HStack {
                // Show the user's photos
                UserView(post: post)
                    .padding(.leading, 8)
                    .padding(.top, 5)
                
                Spacer()
                
                // Show a trash button for deleting if the post author is the main user
                if post.author == "Alan" {
                    Button(action: {
                        if let index = viewModel.solarGramPosts.firstIndex(where: { $0.id == post.id }) {
                            viewModel.deletePostFrom(index: index)
                        }
                    }) {
                        Image(systemName: "trash")
                            .foregroundColor(.red)
                            .padding(.trailing, 8)
                    }
                }
            }
            
            // Show the image for the post (use either "name" or "profileImageName")
            ImageView(post: post, imageType: "photoID")
            
            // Show a love button that toggles the isLoved state variable
            FavoriteButton(post: post)
                .padding(.leading, 8)
                .padding(.bottom, 5)
            // Show the post description
            Text(post.description)
                .font(.footnote)
                .padding(.leading, 8)
                .padding(.bottom, 10)
                .foregroundColor(.primary)
            // Show to comments/add a coment
            .listStyle(PlainListStyle())
            CommentView(post: post /*, clickedOut: $clickedOut*/)
//            TextField("Add a Comment", text: $Post)
            // Show a divider on macOS, but not on iOS/iPadOS/watchOS/tvOS
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
        // A preview of the PostView with a test Post object and a ViewModel object
        PostView(post: Post(photoID: UIImage(named: "photo1"), description: "Biodome", author: "Alan", userPhotoID:  "alan", comments: []))
            .environmentObject(ViewModel())
    }
}

