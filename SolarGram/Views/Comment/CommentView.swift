//
//  CommentView.swift
//  SolarGram
//
//  Created by Andrew Chang on 4/18/23.
//

import SwiftUI

struct CommentView: View {
    
    // Use @State property wrapper to make comment mutable.
    @State var comment: Comment
    
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        HStack{
            Image(viewModel.currentUser?.userImage ?? "default")
                .resizable()
                .clipShape(Circle())
                .frame(width: 32, height: 32)
            Text(viewModel.currentUser?.fullName ?? "Unknown User")
                .font(.headline)
            
            // Display the comment's content.
            Text(comment.content)
            Spacer()
            
            // Change the icon's color based on whether the comment is liked or not.
            Image(systemName: comment.isLiked ? "heart.fill" : "heart")
                .foregroundColor(comment.isLiked ? .red : .primary)
                .padding(.trailing, 4)
                .gesture(TapGesture()
                    .onEnded {
                        comment.isLiked.toggle()
                    }
                )
        }
        .padding(.leading, 4)
        .padding(.trailing, 4)
        
    }
}

struct CommentView_Previews: PreviewProvider {
    static var previews: some View {
        
        // Create a test comment.
        let test = Comment(user: "alan", content: "My First Comment is the longest possible comment in the world")
        
        // Preview the CommentView with the test comment and ViewModel shared instance.
        CommentView(comment: test)
            .environmentObject(ViewModel())
    }
}
