//
//  SolarGramViewModel.swift
//  SolarGram
//
//  Created by Alan Brantley on 3/23/23.
//

import SwiftUI
import UIKit

class ViewModel: ObservableObject {
    
    // MARK -
    
    @Published private var model: PostsManager = PostsManager()
    
    // MARK - vars that are available to the model
    
    var solarGramPosts: [Post] {
        model.feed
    }
    
    // MARK - intents from the user
    
    func setPostFavorite(post: Post) {
        model.toggleFavorite(post)
    }
    
    func deletePostFrom() {
        
    }
    
    func addPostFrom(image: UIImage?) {
        let newId: Int
        newId = model.feed.count + 1

        // make sure the optional is an actual image
        guard let image = image else { return }
        
        // you must do this on the main thread for UI to update properly
        DispatchQueue.main.async {
            
            // create a new post object, it might look like this, but you can adapt as needed in your project.
            let newPost = Post(id: newId, name: "Post \(newId)", userName: "Alan Brantley", profileImageName: "01_AlanBrantley", image: image)
            
            // call some function on the model to add the new post to the array of posts
            self.model.addPost(post: newPost)
        }
    }
}
