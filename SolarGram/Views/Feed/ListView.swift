//
//  PhotosView.swift
//  SolarGram
//
//  Created by Alan Brantley on 3/3/23.
//

import SwiftUI

// A view that displays a list of photo posts
struct ListView: View {
    
    // The view model for the ListView, accessed through environmentObject
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        // Displaying the imageList view
        imageList
    }
    
    // A view that displays a list of posts
    var imageList: some View {
        List(viewModel.solarGramPosts) { post in
            // Displaying each post using PostView and adding some insets
            PostView(post: post)
                .listRowInsets(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
        }
        .listStyle(PlainListStyle())
    }
}

// A preview of the ListView
struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        // Adding a ViewModel to the environmentObject for the preview
        ListView()
            .environmentObject(ViewModel())
    }
}
