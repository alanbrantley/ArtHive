//
//  PostModel.swift
//  SolarGram
//
//  Created by Alan Brantley on 3/3/23.
//
import Foundation

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
}

