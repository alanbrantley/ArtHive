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
    
    // A state variable that stores if the post is loved
    @EnvironmentObject var viewModel: ViewModel
    
    // The name of the image file to be displayed, constructed from the post's id and name
    var imageName: String {
        "\(post.id)_\(post.name)"
    }
    
    var body: some View {
       
        VStack(alignment: .leading) {
            
            // Show the user's photos
            UserView(post: post)
                .padding(.top, 5)
            
            // Show the image for the post
            ImageView(post: post)
            
            // Show the post name
            Text(post.name)
                .font(.footnote)
//                .padding(.leading, 10)
                .padding(.bottom, 10)
            
            // Show a love button that toggles the isLoved state variable
            LoveButton(post: post)
//                .padding(.leading, 10)
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
            . environmentObject(ViewModel())
    }
}
