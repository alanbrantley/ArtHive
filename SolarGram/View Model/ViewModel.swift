//
//  SolarGramViewModel.swift
//  SolarGram
//
//  Created by Alan Brantley on 3/23/23.
//

import SwiftUI

class ViewModel: ObservableObject {
    
    // MARK -
    @Published private var model: PostsManager = PostsManager()
    
    // MARK - vars that are available to the model
    
    var solarGramPosts: [Post] {
        model.posts
    }
    
    // MARK - intents from the user
    
    func setPostFavorite(post: Post) {
        model.toggleFavorite(post)
    }
}
