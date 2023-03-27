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
    
    // Declaring and initializing a ViewModel object to manage data flow
    @State private var viewModel: ViewModel = ViewModel()
    
    // Variables to keep track of whether the ImagePicker and CameraPicker are shown
    @State private var showCameraPicker = false
    @State private var showImagePicker = false
    
    // A Post object to be passed to the ProfileView
    var post: Post
    
    // An enumeration of the four possible tabs
    enum Tab {
        case photos
        case profile
        case picker
        case camera
    }
    
    var body: some View {
        ZStack {
            // A TabView that displays the four tabs
            TabView(selection: $selection) {
                photosView
                profileView
                imagePickerView
                cameraPickerView
            }
        }
    }
    
    // The content of the PhotosView tab
    var photosView: some View {
        // Creating a ListView and passing the ViewModel as an environment object
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
        // Creating a ProfileView and passing the Post and ViewModel as environment objects
        ProfileView(post: post)
            .environmentObject(viewModel)
            .tabItem {
                // The label for the ProfileView tab
                Label("Profile", systemImage: "person.circle.fill")
            }
            .tag(Tab.profile)
    }
    
    // The content of the ImagePicker tab
    var imagePickerView: some View {
        VStack {
            // Creating a button to show the ImagePicker and a list of posts
            Button(action: {
                showImagePicker = true
            }, label: {
                Image(systemName: "photo.on.rectangle.angled")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
            })
            
            List(viewModel.solarGramPosts) { post in
                PostView(post: post)
            }
        }
        // Presenting the ImagePicker in full screen mode when showImagePicker is true
        .fullScreenCover(isPresented: $showImagePicker) {
            ImagePicker(viewModel: viewModel)
        }
        .tabItem {
            // The label for the ImagePicker tab
            Label("Picker", systemImage: "plus.circle.fill")
        }
        .tag(Tab.picker)
    }
    
    // The content of the CameraPicker tab
    var cameraPickerView: some View {
        VStack {
            // Creating a button to show the CameraPicker and a list of posts
            Button(action: {
                showCameraPicker = true
            }, label: {
                Image(systemName: "camera.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
            })
            
            List(viewModel.solarGramPosts) { post in
                PostView(post: post)
            }
        }
        // Presenting the CameraPicker in full screen mode when showCameraPicker is true
        .fullScreenCover(isPresented: $showCameraPicker) {
            CameraPicker(viewModel: viewModel)
        }
    }
}
