//
//  PostModel.swift
//  SolarGram
//
//  Created by Alan Brantley on 3/3/23.
//
import Foundation
import UIKit

struct PostsManager {
    
    // The feed of posts
    var feed: [Post] = [
        Post(photoID: UIImage(named: "photo1"), description: "Biodome", author: "Alan", userPhotoID:  "alan"),
        Post(photoID: UIImage(named: "photo2"), description: "Home", author: "Jasmine", userPhotoID: "jasmine"),
        Post(photoID: UIImage(named: "photo3"), description: "Control", author:  "Samantha", userPhotoID: "samantha"),
        Post(photoID: UIImage(named: "photo4"), description: "Citywalk", author:  "Alan", userPhotoID:  "alan"),
        Post(photoID: UIImage(named: "photo5"), description: "Tram", author:  "Alan", userPhotoID:  "alan"),
        Post(photoID: UIImage(named: "photo6"), description: "Flowerhouse", author: "David", userPhotoID: "david"),
        Post(photoID: UIImage(named: "photo7"), description: "Riverwalk", author: "Issac", userPhotoID: "issac"),
        Post(photoID: UIImage(named: "photo8"), description: "Scpacestation", author: "Jasmine", userPhotoID: "jasmine"),
        Post(photoID: UIImage(named: "photo9"), description: "Treehouse", author:  "Alan", userPhotoID:  "alan"),
        Post(photoID: UIImage(named: "photo10"), description: "Mansion", author:  "Alan", userPhotoID:  "alan")
    ]

    // Function to toggle the favorite status of a post
    mutating func toggleFavorite(_ post: Post) {
        
        let postIndex = feed.firstIndex { p in
            p.id == post.id
        }
        
        guard let actualIndex = postIndex else { return }
        feed[actualIndex].isFavorite.toggle()
    }

    // Function to add a post to the feed
    mutating func addPost(post: Post) {
        feed.append(post)
    }

    // Function to remove a post from the feed
    mutating func removePost(post: Post) {
        if let index = feed.firstIndex(of: post) {
            feed.remove(at: index)
        }
    }

}

struct User {
    var username: String
    var email: String
    var password: String
    var isLoggedIn: Bool
}

// A model representing a post in the app
struct Post: Identifiable, Hashable {
    // The ID of the post
    var id: UUID = UUID()

    // The image of the post
    var photoID: UIImage?

    // The name of the post
    var description: String

    // The user name associated with the post
    var author: String

    // The file name of the profile image associated with the post
    var userPhotoID: String

    // Whether the post is marked as favorite
    var isFavorite: Bool = false

}




