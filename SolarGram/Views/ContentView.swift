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
    @State private var viewModel: ViewModel = ViewModel()
    @State private var showPost = false
    
    
    // A Post object to be passed to the ProfileView
    var post: Post
    
    // An enumeration of the three possible tabs
    enum Tab {
        case photos
        case profile
        case post
    }
    
    var body: some View {
        ZStack {
            // A TabView that displays the three tabs
            TabView(selection: $selection) {
                photosView
                postView
                profileView
            }
        }

    }
    
    // The content of the PhotosView tab
    var photosView: some View {
        ListView()
            .environmentObject(viewModel)
            .tabItem {
                // The label for the PhotosView tab
                Label("Photos", systemImage: "photo.stack.fill")
            }
            .tag(Tab.photos)
    }
    
    // The content of the ProfileView tab
    var profileView: some View {
        ProfileView(post: post)
            .environmentObject(viewModel)
            .tabItem {
                // The label for the ProfileView tab
                Label("Profile", systemImage: "person.circle.fill")
            }
            .tag(Tab.profile)
    }
    
//    The content of the post tab
    var postView: some View {
        AddPost(showNext: .constant(false))
            .environmentObject(viewModel)
            .tabItem {
                Label("Post", systemImage: "plus.circle.fill")
            }
            .tag(Tab.post)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let test = Post(photoID: UIImage(named: "photo1"), description: "Biodome", author: "Alan Brantley", userPhotoID:  "alan")
        ContentView(post: test)
    }
}
