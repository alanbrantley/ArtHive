//
//  ImageView.swift
//  SolarGram
//
//  Created by Alan Brantley on 3/3/23.
//
import SwiftUI

// View that displays an image with an aspect ratio of 1:1 (square)
struct ImageView: View {
    
//    var image: Image
    var aspect: CGFloat = 1.0
    
//    init(_ image: Image) {
//            self.image = image
//    }
    
    // The Post associated with this image view
    var post: Post

    // The image type to be displayed (either 'name' or 'profileImageName')
    var imageType: String
    
//    var imageName: String {
//        "\(post.id)_\(post.name)"
//    }

    // The name of the image file to be displayed, constructed based on the imageType
    var imageName: String {
        switch imageType {
        case "photoID":
            return post.photoID
        case "userPhotoID":
            return post.userPhotoID
        default:
            return ""
        }
    }

    var body: some View {
        
        Rectangle()
            .aspectRatio(aspect, contentMode: .fit)
            .overlay {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
            }
            .clipped()
       }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        let test = Post(photoID: "photo1", description: "Biodome", author: "Alan", userPhotoID:  "alan")
        
        // Use either 'name' or 'profileImageName' as the imageType parameter
        ImageView(post: test, imageType: "photoID")
    }
}

