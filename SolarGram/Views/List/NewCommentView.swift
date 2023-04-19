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
    @State var showSubTextField = false
    @State var height: CGFloat = 0
//    @Binding var clickedOut: Bool
    let placeholder = "Add a Comment"
    
    func emojiText (_ emoji: String) -> Button<Text> {
        Button {
            if self.showSubTextField == false {
                self.showSubTextField = true
            }
            self.commentText += emoji
        } label: {
            Text(emoji)
        }
    }
    
    var body: some View {
        ZStack {
            VStack {
                HStack{
                    
                    ImageView(aspect: 1.0, post: post, imageType: "alan")
                        .clipShape(Circle())
                        .frame(width: 30, height: 30)
                    HStack {
                        TextField("Add a Comment", text: $commentText /*, onEditingChanged: {_ in
                                                                       if self.clickedOut == true {
                                                                       self.clickedOut = false
                                                                       }
                                                                       self.showSubTextField = true
                                                                       }*/
                        ) .overlay(RoundedRectangle(cornerRadius: 5)
                            .stroke(Color(.black), lineWidth: 0.2))
                        Button {
                            
                        } label: {
                            Text("Post")
                                .foregroundColor(Color(.gray))
                        }
                        .padding(.trailing, 10)
//                        emojiText("❤️")
//                        emojiText("👍")
                        
                    }
                }
//                .onAppear{
//                    NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { (noti) in
//                        let value = noti.userInfo! [UIResponder.keyboardFrameEndUserInfoKey] as!CGRect
//                        self.height = value.height
//                        //                    self.clickedOut = false
//                    }
//                    NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { (noti) in
//                        self.height = 0
//                        self.showSubTextField = false
//
//                    }
//                }
//
//                if self.showSubTextField == true {
//                    VStack (spacing: 12){
//                        List(viewModel.solarGramPosts) { post in
//                            // Displaying each post using PostView and adding some insets
//                            PostView(post: post)
//                                .listRowInsets(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
//                        }
//                        .listStyle(PlainListStyle())
//                        HStack{
//                            ImageView(aspect: 1.0, post: post, imageType: "alan")
//                                .clipShape(Circle())
//                                .frame(width: 30, height: 30)
//                            HStack{
//                                CustomTextField(text: $commentText, isFirstResponder: self.showSubTextField)
//
//                                Button {
//
//                                } label: {
//                                    Text("Post")
//                                        .foregroundColor(Color(.gray))
//                                }
//                                .padding(.trailing, 10)
//                            }
//
//                            .frame(height: 35)
//                            .overlay(RoundedRectangle(cornerRadius: 15)
//                                .stroke(Color(.gray),lineWidth: 0.25)
//                            )
//                        }
//                        .frame(height: 50)
//                        .padding(.leading, 4)
//                        .padding(.trailing, 4)
//
//
//                    }
//                    .offset(y: (-self.height / 2) - 12)
//                    .padding(.trailing, 35)
//                }
//            }
            //        .onChange(of: self.clickedOut) { [clickedOut] clickedOutNew in
            //            if clickedOutNew == true {
            //                self.showSubTextField = false
            //            }
            //
            }
        }
    }
}
    
    struct CommentView_Previews: PreviewProvider {
        static var previews: some View {
            let test = Post(photoID: UIImage(named: "photo1"), description: "Biodome", author: "Alan", userPhotoID:  "alan", comments: [Comment(user: "alan", content: "test 1"), Comment(user: "alan", content: "test 2")])
            
            // Use either 'photoID' or 'userPhotoID' as the imageType parameter
            NewCommentView(post: test)
                .environmentObject(ViewModel())
        }
    }

