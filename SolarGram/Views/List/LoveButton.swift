//
//  LoveButton.swift
//  SolarGram
//
//  Created by Alan Brantley on 3/3/23.
//

import SwiftUI

struct LoveButton: View {
    
    var post: Post
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        Button {
            // Toggle the value of  when the button is tapped
            viewModel.setPostFavorite(post: post)
        } label: {
            if post.isFavorite {
                Image(systemName: "heart.fill")
                    .foregroundColor(.black)
            } else {
                Image(systemName: "heart")
                    .foregroundColor(.black)
            }
        }
    }
}

struct LoveButton_Previews: PreviewProvider {
    static var previews: some View {
        let test = Post(id: 1, name: "biodome", userName: "Alan Brantley", profileImageName: "01_AlanBrantley")
        LoveButton(post: test)
            .environmentObject(ViewModel())
        
    }
}
