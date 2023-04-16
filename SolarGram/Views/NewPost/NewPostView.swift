//
//  NewPostView.swift
//  SolarGram
//
//  Created by Rachel Qian on 4/15/23.
//

import SwiftUI

struct NewPostView: View {
    @Environment(\.dismiss) var dismiss

    @EnvironmentObject var viewModel: ViewModel
    @State var description: String = ""
    @State var price: String = ""
    
    @Binding var isPresentNewPost : Bool
    
    @State var isEnhanced: Bool = false

    
    var body: some View {
        VStack{
            //Display he selected image
            if let selectedImage = viewModel.selectedImage {
                SquarePicture(selectedImage)
            }
            
            //User input field for description
            Text("Description")
                .font(.headline)
            TextField(
                "Enter the description for your art piece",
                text: $description
            )
            .padding()
            .background(Color.gray.opacity(0.3).cornerRadius(10))
            
            //user inout field for price
            Text("Price")
                .font(.headline)
            TextField(
                "Price your are piece",
                text: $price
            )
            .padding()
            .background(Color.gray.opacity(0.3).cornerRadius(10))
            
            //Select whether the art piece is AI-enhanced
            Toggle(isOn: $isEnhanced) {
                Text("Is this art piece AI-enhanced?")
            }
            .toggleStyle(.switch)
            
            //Button to submit the post
            Spacer()
            Button("Post My New Art") {
            //Wirte the action once user tap the Post button
                let selectedImage = viewModel.selectedImage
                self.viewModel.addPostFrom(image: selectedImage, description: description, price: price, isEnhanced: isEnhanced)
                dismiss()
                
            }
            .padding()
            .background(Color.black)
            .foregroundColor(Color.white)
            .cornerRadius(40)
            
        }
        .padding()
    }
}

struct NewPostView_Previews: PreviewProvider {
    static var previews: some View {
        NewPostView(isPresentNewPost: .constant(false))
            .environmentObject(ViewModel())
    }
}
