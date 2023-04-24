//
//  AppleButtonView.swift
//  SolarGram
//
//  Created by Alan Brantley on 4/8/23.
//

import SwiftUI

struct AppleSignInButton: View {
    
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var viewModel: ViewModel
    @State private var username: String = "user"
    @State private var password: String = "pass"
    let cornerRadius: CGFloat = 5
    
    var body: some View {
        Button(action: {
            viewModel.signIn(signInMethod: .apple)
        }) {
            HStack {
                Image(systemName: "applelogo")
                    .foregroundColor(colorScheme == .light ? .white : .black)
                    .frame(width: 20, height: 20)
                Text("Sign in with Apple")
                    .foregroundColor(colorScheme == .light ? .white : .black)
                    .font(.headline)
                    .padding(.vertical)
            }
            .frame(maxWidth: .infinity)
            .background(colorScheme == .light ? .black : .white)
            .cornerRadius(cornerRadius)
        }
    }
}

struct AppleSignInButton_Previews: PreviewProvider {
    static var previews: some View {
        AppleSignInButton()
    }
}
