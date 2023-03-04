//
//  ProfileView.swift
//  SolarGram
//
//  Created by Alan Brantley on 3/3/23.
//

import SwiftUI

struct ProfileView: View {
    let images = ["1_biodome", "4_citywalk", "5_tram", "9_treehouse", "10_mansion"]
    
    var post: Post
    
    var body: some View {
        VStack {
            ProfileUserView(post: post)
            ScrollView(.vertical) {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: UIScreen.main.bounds.width / 3 - 20))], spacing: 10) {
                    ForEach(images, id: \.self) { imageName in
                        Image(imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 120, height: 120)
                            .clipped()
                    
                    }
                }
                .padding(.horizontal, 0.0)
            }
            Spacer()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        let test = Post(id: 01, name: "biodome", userName: "Alan Brantley", profileImageName: "01_AlanBrantley")
        ProfileView(post: test)
    }
}
