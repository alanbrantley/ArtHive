//
//  PhotosView.swift
//  SolarGram
//
//  Created by Alan Brantley on 3/3/23.
//

import SwiftUI

// A view tha displays a list of photo posts
struct PhotosView: View {
    
    // An array that holds all posts in the feed
    var feed: [Post] = [
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
    
    var body: some View {
        imageList
    }
    
    // A view that displays a list of posts
    var imageList: some View {
        List(feed) { post in
            PostView(post: post)
        }
        .listStyle(PlainListStyle())
    }
}


struct PhotosView_Previews: PreviewProvider {
    static var previews: some View {
        PhotosView()
    }
}
