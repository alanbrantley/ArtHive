//
//  LoveButton.swift
//  SolarGram
//
//  Created by Alan Brantley on 3/3/23.
//

import SwiftUI

struct LoveButton: View {
    
    // A binding to a boolean variable that determines whether the button is set
    @Binding var isSet: Bool

    var body: some View {
        Button {
            // Toggle the value of `isSet` when the button is tapped
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
