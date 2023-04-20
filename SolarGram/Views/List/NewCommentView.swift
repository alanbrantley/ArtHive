//
//  CommentView.swift
//  SolarGram
//
//  Created by Andrew Chang on 4/15/23.
//

import SwiftUI

struct NewCommentView: View {
    
    // The Post associated with this image view
    var post: Post
    @EnvironmentObject var viewModel: ViewModel
    @State var commentText: String = ""
    @State var height: CGFloat = 0
    let placeholder = "Add a Comment"
    
//    func emojiText (_ emoji: String) -> Button<Text> {
//        Button {
//            if self.showSubTextField == false {
//                self.showSubTextField = true
//            }
//            self.commentText += emoji
//        } label: {
//            Text(emoji)
//        }
//    }
    
    var body: some View {
            VStack {
                HStack{
                    
                    ImageView(aspect: 1.0, post: post, imageType: "alan")
                        .clipShape(Circle())
                        .frame(width: 30, height: 30)
                    HStack {
                        TextField("Add a Comment", text: $commentText)
                            .overlay(RoundedRectangle(cornerRadius: 5)
                            .stroke(Color(.black), lineWidth: 0.2))
                        Button {
                            if commentText != "" {
                                viewModel.addComment(commentText: commentText, for: post.id)
                                commentText = ""
                            }
                            else {
                                //do nothing
                            }
                        } label: {
                            Text("Post")
                                .foregroundColor(Color(.gray))
                        }
                        .padding(.trailing, 10)
                        .buttonStyle(.plain)
//                        emojiText("❤️")
//                        emojiText("👍")
                        
                }
            }
        }
    }
}
    
    struct NewCommentView_Previews: PreviewProvider {
        static var previews: some View {
            let test = Post(photoID: UIImage(named: "photo1"), description: "Biodome", author: "Alan", userPhotoID:  "alan", comments: [Comment(user: "alan", content: "test 1"), Comment(user: "alan", content: "test 2")])
            
            // Use either 'photoID' or 'userPhotoID' as the imageType parameter
            NewCommentView(post: test)
                .environmentObject(ViewModel())
        }
    }

