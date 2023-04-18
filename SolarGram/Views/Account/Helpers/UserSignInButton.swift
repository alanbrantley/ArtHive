//
//  UserSignInButton.swift
//  SolarGram
//
//  Created by Alan Brantley on 4/8/23.
//

import SwiftUI

struct UserSignInButton: View {
    
    @EnvironmentObject var viewModel: ViewModel
    @Binding var username: String
    @Binding var password: String
    
    
    
    let cornerRadius: CGFloat = 5
    var body: some View {
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
    }
}

struct UserSignInButton_Previews: PreviewProvider {
    @State static var username = ""
    @State static var password = ""
    
    static var previews: some View {
        UserSignInButton(username: $username, password: $password)
    }
}
