//
//  PostModel.swift
//  SolarGram
//
//  Created by Alan Brantley on 3/3/23.
//
import Foundation
import UIKit

struct PostsManager {
    
    static var sampleData = [Post(photoID: UIImage(named: "photo1"), description: "Biodome", author: "Sasha", userPhotoID:  "main", comments: [Comment(user: "main", content: "Here is my first comment"), Comment(user: "main", content: "Testing out what two longer comments will look like")])]
    
    // The feed of posts
    var feed: [Post] = [
        Post(photoID: UIImage(named: "photo1"), description: "Biodome", author: "Sasha", userPhotoID:  "main", comments: []),
        Post(photoID: UIImage(named: "photo2"), description: "Home", author: "Jasmine", userPhotoID: "jasmine", comments: []),
        Post(photoID: UIImage(named: "photo3"), description: "Control", author:  "Samantha", userPhotoID: "samantha", comments: []),
        Post(photoID: UIImage(named: "photo4"), description: "Citywalk", author:  "Sasha", userPhotoID:  "main", comments: []),
        Post(photoID: UIImage(named: "photo5"), description: "Tram", author:  "Sasha", userPhotoID:  "main", comments: []),
        Post(photoID: UIImage(named: "photo6"), description: "Flowerhouse", author: "David", userPhotoID: "david", comments: []),
        Post(photoID: UIImage(named: "photo7"), description: "Riverwalk", author: "Issac", userPhotoID: "issac", comments: []),
        Post(photoID: UIImage(named: "photo8"), description: "Scpacestation", author: "Jasmine", userPhotoID: "jasmine", comments: []),
        Post(photoID: UIImage(named: "photo9"), description: "Treehouse", author:  "Sasha", userPhotoID:  "main", comments: []),
        Post(photoID: UIImage(named: "photo10"), description: "Mansion", author:  "Sasha", userPhotoID:  "main", comments: [])
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
    
    // Function to add a commentto the feed
    mutating func addComment(comment: Comment, for postID: UUID) {
        let postIndex = feed.firstIndex { p in
            p.id == postID
        }
        
        guard let actualIndex = postIndex else { return }
        feed[actualIndex].comments.append(comment)
    }
    
    

}

struct User {
    var fullName: String
    var username: String
    var email: String
    var password: String
    var isLoggedIn: Bool
    var userImage: String = "main"
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
    
    //The price of the art piece
    var price: String?
    
    //Whether the art piece is AI-enhanced
    var isEnhanced: Bool = false
    
    //  adding comments
    var comments: [Comment]
        
    }

    struct Comment: Identifiable, Hashable {

        var id: UUID = UUID()
        
        var user: String
        
        var content: String
        
        // Declare a property named `isLiked` of type `Bool`, with a default value of `false`
        var isLiked: Bool = false
        
    }

