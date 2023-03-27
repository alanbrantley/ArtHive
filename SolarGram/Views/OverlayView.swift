//
//  OverlayView.swift
//  SolarGram
//
//  Created by Alan Brantley on 3/26/23.
//

import SwiftUI

struct OverlayView: View {
    
//    var post: Post
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.5)
                .ignoresSafeArea()
            ImagePicker(viewModel: viewModel)
           
        }
    }
}

struct OverlayView_Previews: PreviewProvider {
    static var previews: some View {
        OverlayView()
            .environmentObject(ViewModel())
    }
}
