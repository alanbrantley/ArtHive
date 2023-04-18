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
    
    @State private var showCameraPicker = false
    @State private var showImagePicker = false
    
    @State private var isLoggedIn: Bool = false
    
    // A Post object to be passed to the ProfileView
    var post: Post
    
    // An enumeration of the three possible tabs
    enum Tab {
        case photos
        case profile
        case picker
        case camera
    }
    
    var body: some View {
        ZStack {
            if !isLoggedIn {
                SignInView()
                    .environmentObject(viewModel)
            } else {
                TabView(selection: $selection) {
                    photosView
                    profileView
                    imagePickerView
                    cameraPickerView
                }
            }
        }
        .onReceive(viewModel.$currentUser) { newUser in
            print("ContentView detected currentUser change: \(String(describing: newUser))")
            isLoggedIn = (newUser != nil)
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
    
    // The content of the ImagePicker tab
    var imagePickerView: some View {
        VStack {
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
        .fullScreenCover(isPresented: $showImagePicker) {
            ImagePicker(viewModel: viewModel)
        }
        .tabItem {
            Label("Picker", systemImage: "plus.circle.fill")
        }
        .tag(Tab.picker)
    }

    // The content of the CameraPicker tab
    var cameraPickerView: some View {
        VStack {
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
        .fullScreenCover(isPresented: $showCameraPicker) {
            CameraPicker(viewModel: viewModel)
        }
        .tabItem {
            Label("Camera", systemImage: "camera.circle")
        }
        .tag(Tab.camera)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let test = Post(photoID: UIImage(named: "photo1"), description: "Biodome", author: "Alan Brantley", userPhotoID:  "alan")
        ContentView(post: test)
    }
}
