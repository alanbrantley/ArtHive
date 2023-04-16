//
//  Add Post.swift
//  SolarGram
//
//  Created by Rachel Qian on 4/15/23.
//

import SwiftUI

struct AddPost: View {
    @EnvironmentObject var viewModel: ViewModel
    @State private var showCameraPicker = false
    @State private var showImagePicker = false
    
    
    var body: some View {
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
                ImagePicker(viewModel: viewModel)
            })
            
            //The button for adding a picture from the album
            Button("Upload From Album") {
                showCameraPicker.toggle()
            }
            .padding()
            .background(Color.black)
            .foregroundColor(Color.white)
            .cornerRadius(40)
            .fullScreenCover(isPresented: $showCameraPicker, content: {
                CameraPicker(viewModel: viewModel)
            })
        }
    }
}

struct AddPost_Previews: PreviewProvider {
    static var previews: some View {
        AddPost()
            .environmentObject(ViewModel())
    }
}
