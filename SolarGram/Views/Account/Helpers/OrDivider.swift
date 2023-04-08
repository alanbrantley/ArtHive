//
//  OrDivider.swift
//  SolarGram
//
//  Created by Alan Brantley on 4/8/23.
//

import SwiftUI

struct OrDivider: View {
    
    var body: some View {
        HStack {
            
            Rectangle()
                .fill(Color.gray)
                .frame(height: 1)
            Text("OR")
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(.gray)
            Rectangle()
                .fill(Color.gray)
                .frame(height: 1)
        }
    }
}

struct OrDivider_Previews: PreviewProvider {
    static var previews: some View {
        OrDivider()
    }
}
