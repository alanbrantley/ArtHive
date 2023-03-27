//
//  LoveButton.swift
//  SolarGram
//
//  Created by Alan Brantley on 3/3/23.
//

import SwiftUI

struct FavoriteButton: View {
    
    var post: Post
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        Button {
            // Toggle the value of  when the button is tapped
            viewModel.setPostFavorite(post: post)
        } label: {
            if post.isFavorite {
                Image(systemName: "heart.fill")
                    .foregroundColor(.primary)
            } else {
                Image(systemName: "heart")
                    .foregroundColor(.primary)
            }
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        let test = Post(photoID: "photo1", description: "Biodome", author: "Alan", userPhotoID:  "alan")
        FavoriteButton(post: test)
            .environmentObject(ViewModel())
        
    }
}
