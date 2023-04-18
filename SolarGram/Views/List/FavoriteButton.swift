//
//  LoveButton.swift
//  SolarGram
//
//  Created by Alan Brantley on 3/3/23.
//

import SwiftUI

// A view that displays a heart button for favoriting/unfavoriting a post
struct FavoriteButton: View {
    
    // The post to favorite/unfavorite
    var post: Post
    
    // The view model for the FavoriteButton
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        Button {
            // Toggle the value of isFavorite when the button is tapped
            viewModel.setPostFavorite(post: post)
        } label: {
            if post.isFavorite {
                // Display a filled heart if the post is already favorited
                Image(systemName: "heart.fill")
                    .foregroundColor(.primary)
            } else {
                // Display an unfilled heart if the post is not yet favorited
                Image(systemName: "heart")
                    .foregroundColor(.primary)
            }
        }
        .buttonStyle(.plain)
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        let test = Post(photoID: UIImage(named: "photo1"), description: "Biodome", author: "Alan", userPhotoID:  "alan", comments: [])
        FavoriteButton(post: test)
            .environmentObject(ViewModel())
    }
}
