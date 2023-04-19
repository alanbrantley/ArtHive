//
//  CommentList.swift
//  SolarGram
//
//  Created by Andrew Chang on 4/18/23.
//

import SwiftUI

struct CommentList: View {
    
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        
//        var commentList: some View {
//            List(viewModel.solarGramPosts) { post in
//                // Displaying each post using PostView and adding some insets
//                PostView(post: post)
//                    .listRowInsets(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
//            }
//            .listStyle(PlainListStyle())
//        }
        
    }
}

struct CommentList_Previews: PreviewProvider {
    static var previews: some View {
        CommentList()
    }
}
