//
//  SignInView.swift
//  SolarGram
//
//  Created by Alan Brantley on 4/7/23.
//

import SwiftUI

struct SignInView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var viewModel: ViewModel
    @State private var username: String = ""
    @State private var password: String = ""
    let cornerRadius: CGFloat = 5

    var body: some View {
        VStack {
            Spacer()
            
            AppWordMark()
            
            TextField("Username", text: $username)
                .padding()
                .cornerRadius(cornerRadius)
                .overlay(
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(.gray, lineWidth: 1)
                )
                
            SecureField("Password", text: $password)
                .padding()
                .cornerRadius(cornerRadius)
                .overlay(
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(.gray, lineWidth: 1)
                )
            
            Button(action: {
                viewModel.signIn(username: username, password: password)
            }) {
                Text("Sign In")
                    .foregroundColor(.white)
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.blue)
                    .cornerRadius(cornerRadius)
            }

            OrDivider()
            
            AppleSignInButton()
            
            Spacer()
            
            SignUpPromptFooter()
            
        }
        .padding()
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
