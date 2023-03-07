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
    // Set the screenWidth variable to the width of the main screen
    var screenWidth = NSScreen.main?.frame.width ?? 0
#else
    // Set the screenWidth variable to the width of the main screen using the UIScreen class
    var screenWidth = UIScreen.main.bounds.size.width
#endif


// A view that displays all the elements of a single user post
struct PostView: View {
    
    // A state variable that stores if the post is loved
    @State var isLoved: Bool = true
    
    // The post to display
    var post: Post
    
    var body: some View {
       
        VStack(alignment: .leading) {
            // Show the user's photos
            PhotosUserView(post: post)
                .frame(width: screenWidth)
                .padding(.leading, 10)
                .padding(.top, 5)
            
            // Show the image for the post
            ImageView(post: post)
            
            // Show the post name
            Text(post.name)
                .font(.footnote)
                .padding(.leading, 10)
                .padding(.bottom, 10)
            
            // Show a love button that toggles the isLoved state variable
            LoveButton(isSet: $isLoved)
                .padding(.leading, 10)
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
        PostView(post: Post(id: 1, name: "biodome", userName: "Alan Brantley", profileImageName: "01_AlanBrantley"))
    }
}
