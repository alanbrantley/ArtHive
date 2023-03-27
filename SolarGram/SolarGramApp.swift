//
//  SolarGramApp.swift
//  SolarGram
//
//  Created by Alan Brantley on 3/2/23.
//

import SwiftUI

// Define the SolarGramApp struct as the entry point of the application
@main
struct SolarGramApp: App {
    
    // Create a Post object with the given properties
    let post =  Post(photoID: "photo1", description: "Biodome", author: "Alan Brantley", userPhotoID:  "alan")

    // Define the body of the application
    var body: some Scene {
        
        // Create a window group with the ContentView as the root view
        WindowGroup {
            ContentView(post: post)
        }
    }
}
