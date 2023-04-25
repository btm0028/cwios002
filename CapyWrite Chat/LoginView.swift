//
//  ContentView.swift
//  CapyWrite Chat
//
//  Created by Brandon  Miller on 4/1/23.
//

import SwiftUI
import Foundation
import WebKit



struct LoginView: View {
    
    @State private var username: String = "";
    @State private var password: String = "";
    @State private var errorMessage: String = "";
    @State private var message: String = "";
    @State private var mcidentity: String = "";
    @State private var showRecipientView: Bool = false;
    @State private var showMFAView: Bool = false;
    
    var body: some View {
        if (showRecipientView) {
            RecipientsView()
        }
        else if (showMFAView) {
            PendingMFAView()
        }
        else {
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
                    
                    Text(errorMessage)
                        .frame(height: 150)
                        .foregroundColor(.red)
                    
                    Button("Submit") {
                        signIn()
                    }
                    .foregroundColor(.black)
                    .background(Color.blue)
                    .buttonStyle(.borderedProminent)
                    .controlSize(.regular)
                    
                }
                .padding()
            }
        }
        
        
        
    }
    
    
    func signIn() {
        let url = URL(string: "https://capywrite.com/mobile-signin-verify.php?user=\(username)&pwd=\(password)")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data else {
                    errorMessage = error?.localizedDescription ?? "Unknown error"
                    return
                }
            message = String(data: data, encoding: .utf8) ?? ""
                if let responseText = String(data: data, encoding: .utf8),
                   responseText.contains("SUCCESS") {
                    showRecipientView = true
                    message = responseText
                    if let range = message.range(of: "COOKIE: ") {
                        let index = message.index(message.endIndex, offsetBy: -3)
                        let substring = message[range.upperBound..<index]
                        mcidentity = String(substring)
                        UserDefaults.standard.set(mcidentity, forKey: "mcidentity")

                    }
                    
                } else if let responseText = String(data: data, encoding: .utf8),
                          responseText.contains("MFA Needed") {
                    showMFAView = true
                    message = responseText
                    if let range = message.range(of: "COOKIE: ") {
                        let index = message.index(message.endIndex, offsetBy: -3)
                        let substring = message[range.upperBound..<index]
                        mcidentity = String(substring)
                    }
                } else {
                    if let basic = String(data: data, encoding: .utf8) {
                        let index1 = basic.index(basic.startIndex, offsetBy: 2)
                        let index2 = basic.index(basic.endIndex, offsetBy: -3)
                        let ss = basic[index1..<index2]
                        errorMessage = String(ss)
                    }
                    
                }
            }.resume()
    }

}

