//
//  ProfileUserView.swift
//  SolarGram
//
//  Created by Alan Brantley on 3/3/23.
//

import SwiftUI

struct ProfileUserView: View {
    
    var post: Post
    
    var body: some View {
        VStack {
            Image(post.profileImageName)
                .resizable()
                .frame(width: 60, height: 60)
                .clipShape(Circle())
                .padding(.top)
            
            Text(post.userName)
                .font(.title)
                
            }
        }
    }

struct ProfileUserView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileUserView(post: Post(id: 1, name: "biodome", userName: "Alan Brantley", profileImageName: "01_AlanBrantley"))
    }
}
