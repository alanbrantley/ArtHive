//
//  PhotosUserView.swift
//  SolarGram
//
//  Created by Alan Brantley on 3/3/23.
//

import SwiftUI

//struct User: Identifiable, Codable {
//    var id: Int
//    var userName: String
//    var profileImageName: String
//}

struct PhotosUserView: View {
    
//    var user: User
    var post: Post
    
    var body: some View {
        HStack {
            Image("\(post.profileImageName)")
                .resizable()
                .frame(width: 30, height: 30)
                .clipShape(Circle())
            Text(post.userName)
                .font(.headline)
            Spacer()
        }
        
    }
}

struct PhotosUserView_Previews: PreviewProvider {
    static var previews: some View {
        let test = Post(id: 01, name: "biodome", userName: "Alan Brantley", profileImageName: "01_AlanBrantley")
        PhotosUserView(post: test)
    }
}
