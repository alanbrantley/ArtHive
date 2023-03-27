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
    
    func deletePostFrom(post: Post) {
            model.removePost(post: post)
        }
    
    func addPostFrom(image: UIImage?) {
        // make sure the optional is an actual image
        guard let image = image else { return }

//        // Save the image and get the unique identifier
//        guard let photoID = saveImageToDocumentsDirectory(image: image) else { return }

        // you must do this on the main thread for UI to update properly
        DispatchQueue.main.async {
            // create a new post object
            let newPost = Post(photoID: "\(image)", description: "A new post!", author: "Alan", userPhotoID: "alan")

            // call some function on the model to add the new post to the array of posts
            self.model.addPost(post: newPost)
        }
    }
    
//    private func saveImageToDocumentsDirectory(image: UIImage) -> String? {
//        let fileName = UUID().uuidString
//        let fileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(fileName)
//
//        if let data = image.jpegData(compressionQuality: 1.0) {
//            do {
//                try data.write(to: fileURL)
//                return fileName
//            } catch {
//                print("Error saving image: \(error)")
//            }
//        }
//
//        return nil
//    }
}
