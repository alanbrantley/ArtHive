//
//  CommentView.swift
//  SolarGram
//
//  Created by Andrew Chang on 4/18/23.
//

import SwiftUI

struct CommentView: View {
    
    var comment: Comment
    
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        HStack{
            Image(comment.user)
                .resizable()
                .clipShape(Circle())
                .frame(width: 32, height: 32)
            Text(comment.user)
                .font(.headline)
            Text(comment.content)
            Spacer()
            Image(systemName: "heart")
                .foregroundColor(.primary)
                .padding(.trailing, 4)
        }
        .padding(.leading, 4)
        .padding(.trailing, 4)
        
    }
}

struct CommentView_Previews: PreviewProvider {
    static var previews: some View {
        
        let test = Comment(user: "alan", content: "My First Comment is the longest possible comment in the world")
        
        CommentView(comment: test)
            .environmentObject(ViewModel())
    }
}
