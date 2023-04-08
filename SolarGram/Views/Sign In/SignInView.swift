//
//  SignInView.swift
//  SolarGram
//
//  Created by Alan Brantley on 4/7/23.
//

import SwiftUI

struct SignInView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    @State private var username: String = ""
    @State private var password: String = ""

    var body: some View {
        VStack {
            TextField("Username", text: $username)
                .padding()
                .border(Color.gray, width: 1)
            SecureField("Password", text: $password)
                .padding()
                .border(Color.gray, width: 1)
            Button("Sign In") {
                viewModel.signIn(username: username, password: password)
            }
        }
        .padding()
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
