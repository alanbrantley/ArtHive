//
//  SolarGramApp.swift
//  SolarGram
//
//  Created by Alan Brantley on 3/2/23.
//

import SwiftUI

@main
struct SolarGramApp: App {
    let post = Post(id: 1, name: "biodome", userName: "Alan Brantley", profileImageName: "01_AlanBrantley")
    
    var body: some Scene {
        WindowGroup {
            ContentView(post: post)
        }
    }
}
