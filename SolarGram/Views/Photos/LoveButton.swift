//
//  LoveButton.swift
//  SolarGram
//
//  Created by Alan Brantley on 3/3/23.
//

import SwiftUI

struct LoveButton: View {
    
    @Binding var isSet: Bool
    
    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            Label("Toggle Love", systemImage: isSet ? "heart.fill" : "heart")
                .labelStyle(.iconOnly)
                .foregroundColor(isSet ? .black : .gray)
        }
    }
}

struct LoveButton_Previews: PreviewProvider {
    static var previews: some View {
        LoveButton(isSet: .constant(true))
    }
}
