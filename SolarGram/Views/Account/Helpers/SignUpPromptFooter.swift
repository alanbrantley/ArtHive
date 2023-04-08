//
//  SignUpPromptFooter.swift
//  SolarGram
//
//  Created by Alan Brantley on 4/8/23.
//

import SwiftUI

struct SignUpPromptFooter: View {
    var body: some View {
        
        VStack {
            Divider()
            HStack {
                Text("Don't have an account?")
                    .foregroundColor(.gray)
                Button("Sign Up.") {
                }
                .fontWeight(.semibold)
            }
            .padding(.vertical, 32)
            .font(.caption2)
        }
        
    }
}

struct SignUpPromptFooter_Previews: PreviewProvider {
    static var previews: some View {
        SignUpPromptFooter()
    }
}
