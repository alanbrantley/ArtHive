//
//  PostView.swift
//  SolarGram
//
//  Created by Alan Brantley on 3/3/23.
//

import SwiftUI

struct PostView: View {
    
    
    
    @State var isLoved: Bool = true
    var post: Post
//    var user: User
    
    var body: some View {
       
        VStack(alignment: .leading) {
            PhotosUserView(post: post)
                .padding(.leading, 10)
            ImageView(post: post)
                .padding(.bottom, 5.0)
            LoveButton(isSet: $isLoved)
                .padding(.leading, 10)
                
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(post: Post(id: 1, name: "biodome", userName: "Alan Brantley", profileImageName: "01_AlanBrantley"))
    }
}
