//
//  PostModel.swift
//  SolarGram
//
//  Created by Alan Brantley on 3/3/23.
//
import Foundation

struct PostsManager {
    
    var posts: [Post] = [
        Post(id: 1, name: "biodome", userName: "Alan Brantley", profileImageName: "01_AlanBrantley"),
        Post(id: 2, name: "home", userName: "Jasmine Peters", profileImageName: "03_JasminePeters"),
        Post(id: 3, name: "control", userName: "Samantha Johnson", profileImageName: "05_SamanthaJohnson"),
        Post(id: 4, name: "citywalk", userName: "Alan Brantley", profileImageName: "01_AlanBrantley"),
        Post(id: 5, name: "tram", userName: "Alan Brantley", profileImageName: "01_AlanBrantley"),
        Post(id: 6, name: "flowerHouse", userName: "David Lee", profileImageName: "04_DavidLee"),
        Post(id: 7, name: "riverwalk", userName: "Issac Rodriguez", profileImageName: "02_IssacRodriguez"),
        Post(id: 8, name: "spacestation", userName: "Jasmine Peters", profileImageName: "03_JasminePeters"),
        Post(id: 9, name: "treehouse", userName: "Alan Brantley", profileImageName: "01_AlanBrantley"),
        Post(id: 10, name: "mansion", userName: "Alan Brantley", profileImageName: "01_AlanBrantley"),
    ]

    
    // Mutating func makes some change
    mutating func toggleFavorite(_ post: Post) {
        
        let postIndex = posts.firstIndex { p in
            p.id == post.id
        }
        
        guard let actualIndex = postIndex else { return }
        posts[actualIndex].isFavorite.toggle()
        
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
    
    var isFavorite: Bool = false
}




