//
//  ImageView.swift
//  SolarGram
//
//  Created by Alan Brantley on 3/3/23.
//
import SwiftUI

// A view that displays an image with an aspect ratio of 1:1 (square)
struct ImageView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    
    // The aspect ratio of the image view
    var aspect: CGFloat = 1.0
    
    // The Post associated with this image view
    var post: Post

    // The image type to be displayed (either 'photoID' or 'userPhotoID')
    var imageType: String
    
    // The UIImage to be displayed, based on the imageType
    var uiImage: UIImage? {
        switch imageType {
        case "photoID":
            return post.photoID
        case "userPhotoID":
            return UIImage(named: post.userPhotoID)
        case "userImage":
            if let userImageName = viewModel.currentUser?.userImage {
                return UIImage(named: userImageName)
            } else {
                return UIImage(named: "default")
            }
        default:
            return nil
        }
    }

    var body: some View {
        
        Rectangle()
            .aspectRatio(aspect, contentMode: .fit)
            .overlay {
                // If a UIImage exists, display it within the image view
                if let uiImage = uiImage {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFill()
                }
            }
            .clipped()
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        let test = Post(photoID: UIImage(named: "photo1"), description: "Biodome", author: "Alan", userPhotoID:  "alan", comments: [])
        
        // Use either 'photoID' or 'userPhotoID' as the imageType parameter
        ImageView(post: test, imageType: "photoID")
    }
}


