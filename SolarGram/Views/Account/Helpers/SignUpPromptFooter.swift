//
//  SignUpPromptFooter.swift
//  SolarGram
//
//  Created by Alan Brantley on 4/8/23.
//

import SwiftUI

struct SignUpPromptFooter: View {
    
    @Binding var showingSignUpView: Bool

    var body: some View {
        VStack(spacing: 16) {
            Divider()
            HStack {
                Text("Don't have an account?")
                    .foregroundColor(.gray)
                Button("Sign Up.") {
                    showingSignUpView.toggle()
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
        SignUpPromptFooter(showingSignUpView: .constant(false))
    }
}
