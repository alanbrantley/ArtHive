//
//  CaptureButton.swift
//  SolarGram
//
//  Created by Alan Brantley on 3/26/23.
//

import SwiftUI

struct CaptureButton: View {
    
    @State private var isShowingOverlay = false
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        
        Button(action: {
            self.isShowingOverlay = true
                    print("Button tapped")
                }) {
                    Image(systemName: "plus.circle.fill")
                        .foregroundColor(Color(.systemBlue))
                }
                .buttonStyle(PlainButtonStyle())
                .sheet(isPresented: $isShowingOverlay) {
                    OverlayView()
                }
    }
}

struct CaptureButton_Previews: PreviewProvider {
    static var previews: some View {
        CaptureButton()
            .environmentObject(ViewModel())
    }
}
