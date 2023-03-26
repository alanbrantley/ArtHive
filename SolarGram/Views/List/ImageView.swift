//
//  ImageView.swift
//  SolarGram
//
//  Created by Alan Brantley on 3/3/23.
//

import SwiftUI

// View that displays an image with an aspect ratio of 1:1 (square)
struct ImageView: View {
    
    // The Post associated with this image view
    var post: Post
    
    // The name of the image file to be displayed, constructed from the post's id and name
    var imageName: String {
        "\(post.id)_\(post.name)"
    }

    var body: some View {
        
        // A rectangle with an aspect ratio of 1:1, which acts as a placeholder for the image
        Rectangle()
            .aspectRatio(1, contentMode: .fit)
            .overlay(
                
        // The image to be displayed, which is a resizable image with an aspect ratio that fills the rectangle
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .clipped())
    }
}


struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        let test = Post(id: 1, name: "biodome", userName: "Alan Brantley", profileImageName: "01_AlanBrantley")
        ImageView(post: test)
    }
}
