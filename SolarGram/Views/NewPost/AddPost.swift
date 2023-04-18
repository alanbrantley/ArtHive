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
    
//    @State var isPresentNewPost : Bool = false
    
    @Binding var isPresented: Bool

    

//    var body: some View {
        
        
//        NavigationView {
//            VStack{
//                //The button for taking a picture
//                Button("Take A Picture") {
//                    showImagePicker.toggle()
//                }
//                .padding()
//                .background(Color.black)
//                .foregroundColor(Color.white)
//                .cornerRadius(40)
//                .fullScreenCover(isPresented: $showImagePicker, content: {
//                    CameraPicker(viewModel: viewModel, isPresentNewPost: .constant(false))
//                })
//
//
//                NavigationLink{
//                    VStack {
//                        ImagePicker(viewModel: viewModel, isPresentNewPost: .constant(false))
//                        Button(action: {
//                            self.isPresentNewPost.toggle()
//                        }) {
//                            Text("Add Selected Image")
//                                .padding()
//                                .background(Color.black)
//                                .foregroundColor(Color.white)
//                                .cornerRadius(40)
//                        }.sheet(isPresented: $isPresentNewPost) {
//                            NewPostView(isPresentNewPost: .constant(false))
//                        }
//                    }
//
//                } label: {
//                    Text("Upload From Album")
//                        .padding()
//                        .background(Color.black)
//                        .foregroundColor(Color.white)
//                        .cornerRadius(40)
//                }
//
//
//            }
//        }
//    }
    
    
    var body: some View {
            
            VStack {
                //The button for taking a picture
                Button("Take A Picture") {
                    showCameraPicker.toggle()
                }
                .padding()
                .background(Color.black)
                .foregroundColor(Color.white)
                .cornerRadius(40)
                
                //The button for adding a picture from the album
                
                Button("Upload From Album") {
                    showImagePicker.toggle()
                    isPresented = true
                }
                .padding()
                .background(Color.black)
                .foregroundColor(Color.white)
                .cornerRadius(40)
                
            }
            .fullScreenCover(isPresented: $showCameraPicker, content: {
                cameraStack
            })
            .sheet(isPresented: $showImagePicker, content: {
                imageStack
            })

    }
    
    
    var imageStack: some View {
            NavigationStack {
                ImagePicker(viewModel: viewModel, isPresentNewPost: .constant(false))
                
                NavigationLink {
                    NewPostView(isPresentNewPost: .constant(false), isPresented: $showImagePicker)
                } label: {
                    Text("Add Selected Image")
                }
            }
    }
    
    var cameraStack: some View {
        NavigationStack {
            CameraPicker(viewModel: viewModel, isPresentNewPost: .constant(false))
            
            NavigationLink {
                NewPostView(isPresentNewPost: .constant(false), isPresented: .constant(false))
            } label: {
                
            }
        }
    }
    
}

struct AddPost_Previews: PreviewProvider {
    static var previews: some View {
        AddPost(isPresented: .constant(false))
            .environmentObject(ViewModel())
    }
}
