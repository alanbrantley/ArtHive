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
    @State var showCameraPicker = false
    @State var showImagePicker = false
    @Binding var showNext: Bool
                
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
            }
            .padding()
            .background(Color.black)
            .foregroundColor(Color.white)
            .cornerRadius(40)
            
        }
        .fullScreenCover(isPresented: $showCameraPicker, content: {
            PickerView(isPresented: $showCameraPicker, type: .camera)
        })
        .sheet(isPresented: $showImagePicker, content: {
            PickerView(isPresented: $showImagePicker, type: .image)
        })
    }
}
struct PickerView: View {
    @EnvironmentObject var viewModel: ViewModel
    
    @State var showNextView = false
    
    @Binding var isPresented: Bool
    
    var type: PickerType
    
    enum PickerType {
        case camera, image
    }
    
    var body: some View {
        switch type {
            case .camera: cameraStack
            case .image: imageStack
        }
    }
    
    var cameraStack: some View {
        NavigationStack {
            CameraPicker(viewModel: viewModel, showNext: $showNextView)
                .edgesIgnoringSafeArea([.top, .bottom])
            
                .navigationDestination(isPresented: $showNextView) {
                    NewPostView(isPresented: $isPresented)
                        .navigationBarBackButtonHidden() // the camera cannot refresh itself and the user would get stuck if they go back
                    
                    // instead have a cancel button in case user does not want to post
                        .toolbar {
                            ToolbarItem(placement: .cancellationAction) {
                                Button("Cancel", role: .cancel) {
                                    isPresented = false
                                }
                            }
                        }
                    
                }
        }
    }
    
    var imageStack: some View {
        NavigationStack {
            ImagePicker(viewModel: viewModel)
            
            NavigationLink {
                NewPostView(isPresented: $isPresented)
            } label: {
                Text("Add Selected Image")
            }
        }
    }
}

struct AddPost_Previews: PreviewProvider {
    static var previews: some View {
        AddPost(showNext: .constant(false))
            .environmentObject(ViewModel())
    }
}
