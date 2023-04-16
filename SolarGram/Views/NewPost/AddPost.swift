//
//  Add Post.swift
//  SolarGram
//
//  Created by Rachel Qian on 4/15/23.
//

import SwiftUI

struct AddPost: View {
    @Environment(\.dismiss) var dismiss

    @EnvironmentObject var viewModel: ViewModel
    @State private var showCameraPicker = false
    @State private var showImagePicker = false
    
    @State var isPresentNewPost : Bool = false


    
    
    var body: some View {
        
        
        NavigationView {
            VStack{
                //The button for taking a picture
                Button("Take A Picture") {
                    showImagePicker.toggle()
                }
                .padding()
                .background(Color.black)
                .foregroundColor(Color.white)
                .cornerRadius(40)
                .fullScreenCover(isPresented: $showImagePicker, content: {
                    CameraPicker(viewModel: viewModel, isPresentNewPost: .constant(false))
                })
                
                //The button for adding a picture from the album
                
//                Button("Upload From Album") {
//                    showCameraPicker.toggle()
//                }
//                .padding()
//                .background(Color.black)
//                .foregroundColor(Color.white)
//                .cornerRadius(40)
//                .fullScreenCover(isPresented: $showCameraPicker, content: {
//                    ImagePicker(viewModel: viewModel, isPresentNewPost: .constant(false))
//                    Button(action: {
//                        self.isPresentNewPost.toggle()
//                    }) {
//                        Text("Add Selected Image")
//                    }.sheet(isPresented: $isPresentNewPost) {
//                        NewPostView(isPresentNewPost: .constant(false))
//                   }
//                })
                
                
                NavigationLink{
                    VStack {
                        ImagePicker(viewModel: viewModel, isPresentNewPost: .constant(false))
                        Button(action: {
                            self.isPresentNewPost.toggle()
                        }) {
                            Text("Add Selected Image")
                        }.sheet(isPresented: $isPresentNewPost) {
                            NewPostView(isPresentNewPost: .constant(false))
                        }
                    }
                    
                } label: {
                    Text("Upload From Album")
                }
                
                
            }
        }


        
        
    }
}

struct AddPost_Previews: PreviewProvider {
    static var previews: some View {
        AddPost()
            .environmentObject(ViewModel())
    }
}
