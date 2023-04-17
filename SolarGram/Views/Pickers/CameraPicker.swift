//
//  CameraPicker.swift
//  SolarGram
//
//  Dowloaded by Alan Brantley on 3/25/23.
//
//  Created by Douglas Hewitt on 3/2/23.

import SwiftUI
import UIKit

#if os(iOS)

struct CameraPicker: UIViewControllerRepresentable {
    var viewModel: ViewModel
    @Environment(\.dismiss) private var dismiss
    
    @Binding var isPresentNewPost: Bool


    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let camera = UIImagePickerController()
        camera.sourceType = .camera
        camera.delegate = context.coordinator
        return camera
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        // nothing here
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let parent: CameraPicker
        
        init(_ parent: CameraPicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                // MARK: This is where I send the image from the photo library to the View Model. You should not edit this, instead you should make a ViewModel and a function called "addPostFrom" that works with this.
//                self.parent.viewModel.addPostFrom(image: image, description: "", price: "")
                self.parent.viewModel.selectedImage = image
                self.parent.isPresentNewPost = true
            }
            parent.dismiss()
        }
    }

    
}

struct CameraPicker_Previews: PreviewProvider {
    static var previews: some View {
        CameraPicker(viewModel: ViewModel(), isPresentNewPost: .constant(false))
    }
}
#endif
