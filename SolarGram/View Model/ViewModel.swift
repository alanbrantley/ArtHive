//
//  SolarGramViewModel.swift
//  SolarGram
//
//  Created by Alan Brantley on 3/23/23.
//

// Importing the necessary frameworks to work with SwiftUI
import SwiftUI

// Declaring a ViewModel class that conforms to the ObservableObject protocol
class ViewModel: ObservableObject {
    
    @Published var currentUser: User? = nil
    
    private let dummyUser = User(username: "user", email: "user@solargrame.com", password: "password1", isLoggedIn: false)
    
    // MARK - Variable linking to the model
    
    // Declaring and initializing a private variable that is published whenever it's updated
    @Published private var model: PostsManager = PostsManager()
    
    // MARK - Variables that are available to the model
    
    // Creating a computed variable that returns an array of Post objects
    var solarGramPosts: [Post] {
        
        // Returning the array of posts from the model
        model.feed
    }
    
    // MARK - Intents from the user
    
    // Function that toggles a post's favorite status
    func setPostFavorite(post: Post) {
        
        // Calling the model's function to toggle the post's favorite status
        model.toggleFavorite(post)
    }
    
    // Function that deletes a post from the array of posts based on its index
    func deletePostFrom(index: Int) {
        
        // Accessing the post to be deleted by its index in the array
        let post = solarGramPosts[index]
        
        // Calling the model's function to remove the post from the array
        model.removePost(post: post)
    }
    
    // Function that adds a new post to the array of posts
    func addPostFrom(image: UIImage?) {
        
        // Make sure the optional image parameter is not nil
        guard let image else { return }
        
        // Perform the following on the main thread to ensure the UI updates properly
        DispatchQueue.main.async {
            
            // Create a new Post object with the given image, author, and description
            let newPost = Post(photoID: image, description: "A new post!", author: "Alan", userPhotoID: "alan")
            
            // Call the model's function to add the new post to the array of posts
            self.model.addPost(post: newPost)
        }
    }
    
    func signIn(username: String, password: String) {
        print("Attempting to sign in with username: \(username) and password: \(password)")
        // Check if the provided username and password match the dummy user
        if dummyUser.username == username && dummyUser.password == password {
            // Create a new User object with isLoggedIn set to true
            let loggedInUser = User(username: dummyUser.username, email: dummyUser.email, password: dummyUser.password, isLoggedIn: true)
            currentUser = loggedInUser
            print("logged in successfully \(loggedInUser)")
        } else {
            // Handle invalid credentials (e.g., show an error message)
            print("Invalid username or password")
        }
    }
    
    func signOut() {
        currentUser = nil
    }
    
}
