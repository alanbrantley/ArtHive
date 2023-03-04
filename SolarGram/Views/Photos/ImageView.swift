//
//  ImageView.swift
//  SolarGram
//
//  Created by Alan Brantley on 3/3/23.
//

import SwiftUI

struct ImageView: View {
    
    var screenWidth = UIScreen.main.bounds.size.width
    var post: Post
    
    var body: some View {
        VStack(alignment: .leading) {
            Image("\(post.id)_\(post.name)")
                .resizable()
                .scaledToFill()
                .frame(width: screenWidth, height: screenWidth)
                .clipped()
            Text(post.name)
                .font(.footnote)
                .multilineTextAlignment(.leading)
                .padding(.leading, 10)
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        let test = Post(id: 1, name: "biodome", userName: "Alan Brantley", profileImageName: "01_AlanBrantley")
        ImageView(post: test)
    }
}
