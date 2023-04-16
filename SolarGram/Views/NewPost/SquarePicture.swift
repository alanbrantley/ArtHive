//
//  SquarePicture.swift
//  SolarGram
//
//  Created by Rachel Qian on 4/15/23.
//

import SwiftUI

struct SquarePicture: View {
    
    var image: UIImage
    var aspect: CGFloat = 1.0

    
    init(_ image: UIImage) {
        self.image = image
    }
    
    var body: some View {
        Rectangle()
            .aspectRatio(aspect, contentMode: .fit)
            .overlay {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                
            }
            .clipped()
        }
    }


struct SquarePicture_Previews: PreviewProvider {
    static var previews: some View {
        SquarePicture(UIImage(named: "photo1")!)
    }
}
