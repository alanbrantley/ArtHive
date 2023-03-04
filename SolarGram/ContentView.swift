//
//  ContentView.swift
//  SolarGram
//
//  Created by Alan Brantley on 3/2/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection: Tab = .photos
    var post: Post
    
    enum Tab {
        case photos
        case profile
    }
    
    var body: some View {
        
        // bind selection variable to the body
        TabView(selection: $selection) {
            
            // Featured State
            PhotosView()
                .tabItem {
                   Label("Photos", systemImage: "photo.stack.fill")
               }
               .tag(Tab.photos)

            // Default State
            ProfileView(post: post)
                .tabItem {
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
