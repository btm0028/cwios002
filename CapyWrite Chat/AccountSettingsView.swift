//
//  AccountSettingsView.swift
//  CapyWrite Chat
//
//  Created by Brandon  Miller on 4/2/23.
//


import SwiftUI



struct AccountSettingsView: View {
    @State private var showRecipients: Bool = false;
    
    var body: some View {
        if (showRecipients) {
            RecipientsView()
                .transition(.slide)
        }
        else {
            ZStack {
                Color.indigo
                    .ignoresSafeArea()

                VStack {
                    HStack {
                        Image(systemName: "chevron.backward")
                        Text("Back")
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .onTapGesture {
                        withAnimation {
                            showRecipients.toggle()
                        }
                        
                    }
                    
                    Image("Logo")
                        .resizable()
                        .frame(width: 85, height: 85)
                    
                    List {
                        HStack {
                            Image(systemName: "person.circle.fill")
                                .frame(width: 10)
                            Text("Change Username")
                            Spacer()
                            Image(systemName: "chevron.forward")
                                .foregroundColor(Color.gray)
                        }
                        .frame(maxWidth: .infinity)
                        HStack {
                            Image(systemName: "person.badge.key.fill")
                                .frame(width: 10)
                            Text("Change Password")
                            Spacer()
                            Image(systemName: "chevron.forward")
                                .foregroundColor(Color.gray)
                        }
                        .frame(maxWidth: .infinity)
                        HStack {
                            Image(systemName: "photo.circle.fill")
                                .frame(width: 10)
                            Text("Change Profile Picture")
                            Spacer()
                            Image(systemName: "chevron.forward")
                                .foregroundColor(Color.gray)
                        }
                        .frame(maxWidth: .infinity)
                        Button("Sign Out") {
                            
                        }
                        .foregroundColor(Color.red)
                    }
                    .navigationTitle("Settings")
                    .background(Color.indigo)
                      
                }
                
                
            }.onTapGesture {
                self.hideKeyboard()
            }}
    }
}




