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
            Text("SolarGram")
                .font(.largeTitle)
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
            
            UserSignInButton()

            HStack {
                Text("OR")
                    .font(.caption2)
                    .foregroundColor(.gray)
            }
            .padding(.top, 15.0)
            
            AppleSignInButton()
            
            Spacer()
            
            Divider()
            
            HStack {
                Text("Don't have an account?")
                    .foregroundColor(.gray)
                Button("Sign Up.") {
                }
                .fontWeight(.semibold)
            }
            .padding(.top, 32.0)
            .font(.caption2)
            
        }
        .padding()
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
