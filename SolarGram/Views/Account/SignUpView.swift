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
    @Binding var showingSignUpView: Bool
    let cornerRadius: CGFloat = 5
    
    var body: some View {
        
        VStack(spacing: 24) {
            
            closeButton
            
            AppWordMark()
            
            Text("Sign up to post, sell, and trade with your friends and fans.")
                .font(.body)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
                .foregroundColor(.gray)
            
            AppleSignInButton()
            
            
            OrDivider()
            
            inputFields
            
            SignUpButton(email: $email, fullName: $fullName, username: $username, password: $password)
            
            Text("By signing up, you agree to our Terms, Data Policy, and Cookies Policy")
                .font(.footnote)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 60)
                .foregroundColor(.gray)
            }
            .padding()
    }
    
    var inputFields: some View {
        VStack {
            
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
        }
    }
    
    var closeButton: some View {
            HStack {
                Spacer()
                Button(action: {
                    showingSignUpView.toggle()
                }) {
                    Image(systemName: "xmark")
                        .foregroundColor(.gray)
                        .padding()
                }
            }
        }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(showingSignUpView: .constant(false))
    }
}
