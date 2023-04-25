//
//  SignUpView.swift
//  CapyWrite Chat
//
//  Created by Brandon  Miller on 4/2/23.
//

import SwiftUI

struct SignUpView: View {
    @State private var username: String = "";
    @State private var email: String = "";
    @State private var password: String = "";
    @State private var confirmPassword: String = "";
    @State private var country: String = "";
    
    var body: some View {
        ZStack {
            Color.indigo
                .ignoresSafeArea()
            
            VStack {
                Image("Logo")
                    .resizable()
                    .frame(width: 120, height: 120)
                
                Spacer()
                    .frame(height: 120)
                
                HStack {
                    Text("Username")
                        .frame(width: 100)
                    TextField(
                        "Username",
                        text: $username,
                        prompt: Text("Username")
                    )
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .border(.secondary)
                    .background(Color.white)
                    .frame(width: 200)
                    .foregroundColor(.black)
                }
                
                HStack {
                    Text("Email")
                        .frame(width: 100)
                    TextField(
                        "Email",
                        text: $email,
                        prompt: Text("Email")
                    )
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .border(.secondary)
                    .background(Color.white)
                    .frame(width: 200)
                    .foregroundColor(.black)
                }
                
                HStack {
                    Text("Password")
                        .frame(width: 100)
                    SecureField(
                        "Password",
                        text: $password,
                        prompt: Text("Password")
                    )
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .border(.secondary)
                    .background(Color.white)
                    .frame(width: 200)
                    .foregroundColor(.black)
                }
                
                HStack {
                    Text("Confirm Password")
                        .frame(width: 100)
                    SecureField(
                        "Confirm Password",
                        text: $confirmPassword,
                        prompt: Text("Confirm Password")
                    )
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .border(.secondary)
                    .background(Color.white)
                    .frame(width: 200)
                    .foregroundColor(.black)
                }
                
                Button("Submit") {
                    
                }
                .foregroundColor(.black)
                .background(Color.blue)
                .buttonStyle(.borderedProminent)
                .controlSize(.regular)
                

            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
