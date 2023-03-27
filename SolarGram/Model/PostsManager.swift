//
//  PostModel.swift
//  SolarGram
//
//  Created by Alan Brantley on 3/3/23.
//
import SwiftUI

struct PostsManager {
    
    var feed: [Post] = [
        Post(id: 1, name: "biodome", userName: "Alan Brantley", profileImageName: "01_AlanBrantley", image: nil),
        Post(id: 2, name: "home", userName: "Jasmine Peters", profileImageName: "03_JasminePeters", image: nil),
        Post(id: 3, name: "control", userName: "Samantha Johnson", profileImageName: "05_SamanthaJohnson", image: nil),
        Post(id: 4, name: "citywalk", userName: "Alan Brantley", profileImageName: "01_AlanBrantley", image: nil),
        Post(id: 5, name: "tram", userName: "Alan Brantley", profileImageName: "01_AlanBrantley", image: nil),
        Post(id: 6, name: "flowerHouse", userName: "David Lee", profileImageName: "04_DavidLee", image: nil),
        Post(id: 7, name: "riverwalk", userName: "Issac Rodriguez", profileImageName: "02_IssacRodriguez", image: nil),
        Post(id: 8, name: "spacestation", userName: "Jasmine Peters", profileImageName: "03_JasminePeters", image: nil),
        Post(id: 9, name: "treehouse", userName: "Alan Brantley", profileImageName: "01_AlanBrantley", image: nil),
        Post(id: 10, name: "mansion", userName: "Alan Brantley", profileImageName: "01_AlanBrantley", image: nil),
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
    // The ID of the post
    var id: Int
    // The name of the post
    var name: String
    // The user name associated with the post
    var userName: String
    // The file name of the profile image associated with the post
    var profileImageName: String
    
    var image: UIImage?
    
    var isFavorite: Bool = false
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
         
}




