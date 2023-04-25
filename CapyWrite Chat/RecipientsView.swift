//
//  RecipientsView.swift
//  CapyWrite Chat
//
//  Created by Brandon  Miller on 4/2/23.
//

import SwiftUI
import Foundation
import SignalRClient

struct UserView: View {
    let username: String
    let lastMessage: String
    let id: String
    
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: "https://capywritestorage.blob.core.windows.net/profilepics/" + id + ".jpeg?sp=r&st=2023-03-15T02:37:57Z&se=2023-12-14T11:37:57Z&spr=https&sv=2021-12-02&sr=c&sig=A9u1nu716lMsZnjtG%2B6lKrcV7BZEoLoy6GK96Su8bWg%3D")) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: 60, maxHeight: 60)
                    .clipShape(Circle())
                }
                placeholder: {
                    ProgressView()
                }
                
                
            VStack {
                Text(username)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(lastMessage)
                    .foregroundColor(Color.gray)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        
        
    }
}

// Referenced from Stack Overflow post on backslides
extension AnyTransition {
    static var backslide: AnyTransition {
        AnyTransition.asymmetric(
            insertion: .move(edge: .trailing),
            removal: .move(edge: .leading))}
    }



struct RecipientsView: View {
    
    @ObservedObject var profiles = RecipientsViewModel()
    
    @State private var search: String = "";
    @State private var prev: String = "";
    @State private var showMessages: Bool = false;
    @State private var showAccountView: Bool = false;
    @State private var id: String = "";
    
    
    
    var body: some View {
        if (showMessages) {
            MessagesView(id: id)
                .transition(.backslide)
        }
        else if (showAccountView) {
            AccountSettingsView()
                .transition(.backslide)
        }
        else {
            
            ZStack {
                Color.indigo
                    .ignoresSafeArea()
                ScrollView {
                    
                }
                VStack {
                    HStack {
                        Spacer()
                        Image(systemName: "gearshape.fill")
                            .onTapGesture {
                                withAnimation {
                                    showAccountView.toggle()
                                }
                            }
                    }
                    .padding()
                    
                    
                    Image("Logo")
                        .resizable()
                        .frame(width: 85, height: 85)
                    
                    HStack {
                        TextField(
                            "Search",
                            text: $search,
                            prompt: Text("Search...")
                        )
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                        .border(.secondary)
                        .background(Color.white)
                        .frame(width: 200, height: 50)
                        .foregroundColor(.black)
                        
                    }
                    List {
                        ForEach(profiles.recipientData) { profile in
                            UserView(username: "@" + profile.username, lastMessage: profile.lastMessage, id: profile.id)
                                .onTapGesture {
                                    withAnimation {
                                        id = String(profile.id)
                                        print(id)
                                        showMessages.toggle()
                                    }
                                }
                        }
                    }
                    .navigationTitle("Recipients")
                    .background(Color.indigo)
                    .onAppear {
                        profiles.grabRecipients()
                    }
                    .refreshable() {
                        profiles.grabRecipients()
                        //profiles.addRecipient()
                    }
                     
                }
                
            }.onTapGesture {
                self.hideKeyboard()
            }}
    }
}

