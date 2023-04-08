//
//  SignUpView.swift
//  SolarGram
//
//  Created by Alan Brantley on 4/7/23.
//

import SwiftUI

struct SignUpView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    @State private var email: String = ""
    @State private var fullName: String = ""
    @State private var username: String = ""
    @State private var password: String = ""
    let cornerRadius: CGFloat = 5
    
    var body: some View {
        
        VStack {
            
            AppWordMark()
            
            Text("Sign up to post, sell, and trade with your friends and fans.")
                .multilineTextAlignment(.center)
                .padding(16)

            
            AppleSignInButton()
            
            
            OrDivider()
            
            TextField("Email", text: $email)
                .padding()
                .cornerRadius(cornerRadius)
                .overlay(
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(.gray, lineWidth: 1)
                )
            
            TextField("Full Name", text: $fullName)
                .padding()
                .cornerRadius(cornerRadius)
                .overlay(
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(.gray, lineWidth: 1)
                )
            
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
            
            SignUpButton()
                .padding(.vertical, 16)
            
            Text("By signing up, you agree to our Terms, Data Policy, and Cookies Policy")
                .multilineTextAlignment(.center)
                .padding(.horizontal, 60)
        }
        .padding()
        
       
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
