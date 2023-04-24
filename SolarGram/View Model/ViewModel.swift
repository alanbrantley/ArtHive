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
    
    private var registeredUsers: [User] = [
        User(fullName: "Sasha", username: "Sasha", email: "user@solargram.com", password: "1234", isLoggedIn: false, userImage: "main")
    ]
    
    // MARK - Variable linking to the model
    
    // Declaring and initializing a private variable that is published whenever it's updated
    @Published private var model: PostsManager = PostsManager()
    @Published var selectedImage: UIImage? // add a variable to store the selected image



    
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
    
    //Add a new Post
    func addPostFrom(image: UIImage?, description: String, price: String, isEnhanced: Bool) {
        guard let image = selectedImage else { return }
        
        
        DispatchQueue.main.async {
            if let currentUser = self.currentUser {
                let newPost = Post(photoID: image, description: description, author: currentUser.fullName, userPhotoID: currentUser.userImage, price: price, isEnhanced: isEnhanced, comments: [])
                self.model.addPost(post: newPost)
            } else {
                print("Error: current user is nil.")
            }
        }
    }
    
    // MARK - Add comments
    
    //     Function that adds a new comment to the array of posts
        func addComment(commentText: String, for postID: UUID) {
            // Make sure the optional image parameter is not nil
    //        guard let commentText else { return }
            
            // Perform the following on the main thread to ensure the UI updates properly
            DispatchQueue.main.async {
                // Create a new Post object with the given image, author, and description
                let newComment = Comment(user: "main", content: commentText)
                
                // Call the model's function to add the new post to the array of posts
                self.model.addComment(comment: newComment, for: postID)
            }
        }
    
    
    // MARK - Create account, sign in, sign out
    
    func signUp(email: String, fullName: String, username: String, password: String) {
        let newUser = User(fullName: fullName, username: username, email: email, password: password, isLoggedIn: true, userImage: "default")
        registeredUsers.append(newUser)
        currentUser = newUser
        
        print("Current user's username: \(currentUser?.username ?? "unknown")")
    }
    
    // Sign into account using regular or apple sign in method
    
    enum SignInMethod {
        case regular
        case apple
    }

    func signIn(username: String? = nil, password: String? = nil, signInMethod: SignInMethod = .regular) {
        switch signInMethod {
        case .regular:
            guard let username = username, let password = password else {
                print("Invalid username or password")
                return
            }

            for user in registeredUsers {
                if user.username == username && user.password == password {
                    let loggedInUser = User(fullName: user.fullName, username: user.username, email: user.email, password: user.password, isLoggedIn: true, userImage: user.userImage)
                    currentUser = loggedInUser
                    break
                }
            }

            if currentUser == nil {
                print("Invalid username or password")
            }
        case .apple:
            if let firstUser = registeredUsers.first {
                let loggedInUser = User(fullName: firstUser.fullName, username: firstUser.username, email: firstUser.email, password: firstUser.password, isLoggedIn: true)
                currentUser = loggedInUser
            } else {
                print("No user available to sign in with Apple")
            }
        }
    }
    
    
    func signOut() {
        currentUser = nil
    }
    
}
