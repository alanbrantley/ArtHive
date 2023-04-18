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
    @State private var showingSignUpView = false
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
            
            UserSignInButton(username: $username, password: $password)
            
            OrDivider()
            
            AppleSignInButton()
            
            Spacer()
            
            SignUpPromptFooter(showingSignUpView: $showingSignUpView)
            
        }
        .padding(.horizontal)
        .sheet(isPresented: $showingSignUpView) {
            SignUpView(showingSignUpView: $showingSignUpView)
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
