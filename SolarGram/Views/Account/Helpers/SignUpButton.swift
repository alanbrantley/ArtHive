//
//  SignUpButton.swift
//  SolarGram
//
//  Created by Alan Brantley on 4/8/23.
//

import SwiftUI

struct SignUpButton: View {
    @EnvironmentObject var viewModel: ViewModel
    @Binding var email: String
    @Binding var fullName: String
    @Binding var username: String
    @Binding var password: String
    let cornerRadius: CGFloat = 5
    
    var isEnabled: Bool {
        !email.isEmpty && !fullName.isEmpty && !username.isEmpty && !password.isEmpty
    }

    var body: some View {
        Button(action: {
            viewModel.signUp(email: email, fullName: fullName, username: username, password: password)
        }) {
            Text("Sign Up")
                .foregroundColor(.white)
                .font(.headline)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(cornerRadius)
                .opacity(isEnabled ? 1 : 0.5)
        }
        .disabled(!isEnabled)
    }
}

struct SignUpButton_Previews: PreviewProvider {
    static var previews: some View {
        SignUpButton(
            email: .constant(""),
            fullName: .constant(""),
            username: .constant(""),
            password: .constant(""))
    }
}
