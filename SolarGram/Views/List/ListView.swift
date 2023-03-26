//
//  PhotosView.swift
//  SolarGram
//
//  Created by Alan Brantley on 3/3/23.
//

import SwiftUI

// A view tha displays a list of photo posts
struct ListView: View {

    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        imageList
    }
    
    // A view that displays a list of posts
    var imageList: some View {
        List(viewModel.solarGramPosts) { post in
            PostView(post: post)
                .listRowInsets(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
        }
        .listStyle(PlainListStyle())
        
    }
}


struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
            .environmentObject(ViewModel())
    }
}
