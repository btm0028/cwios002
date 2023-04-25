//
//  SignUpView.swift
//  CapyWrite Chat
//
//  Created by Brandon  Miller on 4/2/23.
//

import SwiftUI

struct ForgotPasswordView: View {
    @State private var email: String = "";
    
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
                    .frame(width: 200, height: 120)
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

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
