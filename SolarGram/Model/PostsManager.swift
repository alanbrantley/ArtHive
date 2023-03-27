//
//  PostModel.swift
//  SolarGram
//
//  Created by Alan Brantley on 3/3/23.
//
import SwiftUI

struct PostsManager {
    
    var feed: [Post] = [
            Post(photoID: "photo1", description: "Biodome", author: "Alan", userPhotoID:  "alan"),
            Post(photoID: "photo2", description: "Home", author: "Jasmine", userPhotoID: "jasmine"),
            Post(photoID: "photo3", description: "Control", author:  "Samantha", userPhotoID: "samantha"),
            Post(photoID: "photo4", description: "Citywalk", author:  "Alan", userPhotoID:  "alan"),
            Post(photoID: "photo5", description: "Tram", author:  "Alan", userPhotoID:  "alan"),
            Post(photoID: "photo6", description: "Flowerhouse", author: "David", userPhotoID: "david"),
            Post(photoID: "photo7", description: "Riverwalk", author: "Issac", userPhotoID: "isac"),
            Post(photoID: "photo8", description: "Scpacestation", author: "Jasmine", userPhotoID: "jasmine"),
            Post(photoID: "photo9", description: "Treehouse", author:  "Alan", userPhotoID:  "alan"),
            Post(photoID: "photo10", description: "Mansion", author:  "Alan", userPhotoID:  "alan")
    ]

    
    // Mutating func makes some change
    mutating func toggleFavorite(_ post: Post) {
        
        let postIndex = feed.firstIndex { p in
            p.id == post.id
        }
        
        guard let actualIndex = postIndex else { return }
        feed[actualIndex].isFavorite.toggle()
        
    }
    
    mutating func addPost(post: Post) {
        feed.append(post)
    }
    
    mutating func removePost(post: Post) {
        if let index = feed.firstIndex(of: post) {
            feed.remove(at: index)
        }
    }

}

// A model representing a post in the app
struct Post: Identifiable, Hashable {
    var id: UUID = UUID()
    // The ID of the post
    var photoID: String
    // The name of the post
    var description: String
    // The user name associated with the post
    var author: String
    // The file name of the profile image associated with the post
    var userPhotoID: String
    
    var isFavorite: Bool = false
    
//    var image: UIImage?       
}




