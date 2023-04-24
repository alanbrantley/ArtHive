//
//  CommentList.swift
//  SolarGram
//
//  Created by Andrew Chang on 4/18/23.
//

import SwiftUI

struct CommentList: View {
    
        @EnvironmentObject var viewModel: ViewModel
    
    var comments: [Comment]
    
    
    var body: some View {
        
        ForEach(comments) { comment in
            // Displaying each post using CommentView and adding some insets
            CommentView(comment: comment)
        }
    }
}
        
        

struct CommentList_Previews: PreviewProvider {
    static var previews: some View {
        
        let comments = PostsManager.sampleData.first!.comments
        
        CommentList(comments: comments)
            .environmentObject(ViewModel())
    }
}
