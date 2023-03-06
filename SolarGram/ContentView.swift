//
//  ContentView.swift
//  SolarGram
//
//  Created by Alan Brantley on 3/2/23.
//

import SwiftUI

// The main view of the app
struct ContentView: View {
    
    // Keeps track of the selected tab
    @State private var selection: Tab = .photos
    
    // A Post object to be passed to the ProfileView
    var post: Post
    
    // An enumeration of the two possible tabs
    enum Tab {
        case photos
        case profile
    }
    
    var body: some View {
        
        // A TabView that displays the two tabs
        TabView(selection: $selection) {
            
            // The first tab, PhotosView
            PhotosView()
                .tabItem {
                    // The label for the PhotosView tab
                   Label("Photos", systemImage: "photo.stack.fill")
               }
               .tag(Tab.photos)
            
            // The second tab, ProfileView
            ProfileView(post: post)
                .tabItem {
                    // The label for the ProfileView tab
                   Label("Profile", systemImage: "person.circle.fill")
               }
               .tag(Tab.profile)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let test = Post(id: 01, name: "biodome", userName: "Alan Brantley", profileImageName: "01_AlanBrantley")
        ContentView(post: test)
    }
}
